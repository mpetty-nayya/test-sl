# Overview

OpenAPI docs for Decision Support API

# Workflow

1. Modify appropriate OpenAPI yaml and/or JSON schemas
2. Merge modification to `main` branch
3. That's it.  `main` is automatically deployed for public viewing by stoplight

# Bundle HrOpen

Bundle OpenAPI spec and all $ref into on OpenAPI file. 

## Stoplight UI

1. Go To Splight Web UI
2. Select OpenAPI YAML
3. Click Export / Bundled

## Swagger CLI

Install

`npm install -g @apidevtools/swagger-cli`  

Run

`swagger-cli bundle --type --outfile reference/hropen-bundled.yaml reference/decision-support-api-hropen.yam`