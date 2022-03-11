package test

import (
	"crypto/tls"
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/docker"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformWebsiteResponse(t *testing.T) {
	t.Parallel()

	uniqueID := random.UniqueId()
	img_name := fmt.Sprintf("website_test-%s", strings.ToLower(uniqueID))
	buildOptions := &docker.BuildOptions{
		Tags: []string{img_name},
	}

	docker.Build(t, "../", buildOptions)

	tfOptions := &terraform.Options{
		TerraformDir: "../module/",
		Vars: map[string]interface{}{
			"docker_img": img_name,
		},
	}

	terraform.InitAndApply(t, tfOptions)
	homepage := terraform.Output(t, tfOptions, "ip_adress")

	conf := &tls.Config{}

	http_helper.HttpGetWithCustomValidation(t, homepage, conf, func(status int, content string) bool {
		return status == 200 && strings.Contains(content, "Have a good day :)")
	})

	terraform.Destroy(t, tfOptions)
	docker.DeleteImage(t, img_name, logger.Default)
}
