
import SwaggerParser from "@apidevtools/swagger-parser";
import Mustache from "mustache";
import { promises as fs } from "fs"

async function readSchemas(path) {
    let parser = new SwaggerParser();    
    await parser.dereference(path);    
    return parser.api.components.schemas;
}

async function readTemplate(path) {
    const data = await fs.readFile(path);    
    return data.toString();
}

let schemas = await readSchemas("reference/decision-support-api-hropen-bundled.yaml");
let template = await readTemplate("dry-validation.mustache");
Object.keys(schemas).forEach(key => {
    let schema = schemas[key]
    console.log(`---  ${schema.title} ----`)
    console.log('----------------')    
    console.log(schemas[key])    
    var output = Mustache.render(template, schemas[key]);
    console.log('-----')
    console.log(output);    
    console.log('----------------')
})
