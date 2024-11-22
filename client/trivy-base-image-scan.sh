#!/bin/bash
dockerimage=$(awk 'NR==2 {print $2}' Dockerfile)

docker run --rm -v $PWD:/myapp aquasec/trivy -q image --exit-code 0 --severity HIGH --light $dockerimage
docker run --rm -v $PWD:/myapp aquasec/trivy -q image --exit-code 1 --severity CRITICAL --light $dockerimage

# exit_code=$?

# if [[ "${exit_code}" == 1]]; then
#     echo "Image scanning failed. Vulnerabilities found"
#     exit 1;
# else
#     echo "Image scanning passed. No vulnerabilities found"
# fi;