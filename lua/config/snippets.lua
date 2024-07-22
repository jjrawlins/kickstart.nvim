local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamic_node = ls.dynamic_node

local date = function()
  return { os.date("%Y-%m-%d") }
end

local get_filename = function()
  local bufname = vim.fn.expand("%:t:r")
  if bufname == "" then
    return ""
  else
    return bufname
  end
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "jest-test-mocking",
      namr = "Jest Test Mocking",
      dscr = "Example of mocking a module in a Jest test",
    }, {
      text({
        "import { ApiTestPayload } from './resources/ApiCallTestPayloads';",
        "import { FunctionUtilityOne } from '../src/handlers/FunctionUtilityOne';",
        "import { FunctionUtilityTwo } from '../src/handlers/FunctionUtilityTwo';",
        "import { handler } from '../src/handlers/ExampleLambdaFunction.handler';",
        "",
        "jest.mock('../src/handlers/FunctionUtilityOne');",
        "jest.mock('../src/handlers/FunctionUtilityTwo');",
        "",
        "describe('FunctionUtilityTwo tests', () => {",
        "  beforeEach(() => {",
        "    process.env.AWS_REGION = 'us-east-2';",
        "  });",
        "",
        "  test('FunctionUtilityTwo.getValue is called with correct parameters', async () => {",
        "    const mockGetSecretString = jest.fn().mockReturnValue('mockedSecretKey');",
        "    FunctionUtilityOne.prototype.getSecretString = mockGetSecretString;",
        "",
        "    const mockGetValue = jest.fn().mockReturnValue('mockedConfigValue');",
        "    FunctionUtilityTwo.prototype.getValue = mockGetValue;",
        "",
        "    const event = JSON.parse(ApiTestPayload);",
        "    const result = await handler(event);",
        "",
        "    console.log(result);",
        "",
        "    expect(mockGetSecretString).toHaveBeenCalledWith('FooBar/myFooSecret');",
        "    expect(mockGetValue).toHaveBeenCalledWith('configValue');",
        "  });",
        "",
        "  test('FunctionUtilityTwo.getValue returns correct value', async () => {",
        "    const mockGetSecretString = jest.fn().mockReturnValue('mockedSecretKey');",
        "    FunctionUtilityOne.prototype.getSecretString = mockGetSecretString;",
        "",
        "    const mockGetValue = jest.fn().mockReturnValue('mockedConfigValue');",
        "    FunctionUtilityTwo.prototype.getValue = mockGetValue;",
        "",
        "    const event = JSON.parse(ApiTestPayload);",
        "    const result = await handler(event);",
        "",
        "    console.log(result);",
        "",
        "    expect(result).toEqual({",
        "      statusCode: 200,",
        "      body: 'Request processed successfully',",
        "    });",
        "    expect(mockGetValue).toHaveBeenCalledWith('configValue');",
        "  });",
        "",
        "  test('FunctionUtilityTwo.getValue throws error for unknown secret', async () => {",
        "    const mockGetSecretString = jest.fn().mockReturnValue('mockedSecretKey');",
        "    FunctionUtilityOne.prototype.getSecretString = mockGetSecretString;",
        "",
        "    const mockGetValue = jest.fn().mockImplementation(() => {",
        "      throw new Error('Secret unknownSecretKey not found');",
        "    });",
        "    FunctionUtilityTwo.prototype.getValue = mockGetValue;",
        "",
        "    const event = JSON.parse(ApiTestPayload);",
        "    await expect(handler(event)).rejects.toThrow('Secret unknownSecretKey not found');",
        "  });",
        "});",
      }),
    }),
    snip({
      trig = "datadog-aspect",
      namr = "Datadog Aspect",
      dscr = "Create a Datadog Aspect class",
    }, {
      text({
        "import { PythonFunction } from '@aws-cdk/aws-lambda-python-alpha';",
        "import { IAspect } from 'aws-cdk-lib';",
        "import { Function } from 'aws-cdk-lib/aws-lambda';",
        "import { NodejsFunction } from 'aws-cdk-lib/aws-lambda-nodejs';",
        "import { Secretsmanager } from 'cdk-iam-floyd';",
        "import { IConstruct } from 'constructs';",
        "import { Datadog } from 'datadog-cdk-constructs-v2';",
        "",
        "interface DataDogAspectProps {",
        "  datadog: Datadog;",
        "  datadogApiSecretArn?: string;",
        "}",
        "",
        "export class DatadogAspect implements IAspect {",
        "  constructor(private props: DataDogAspectProps) {",
        "  }",
        "",
        "  visit(node: IConstruct): void {",
        "    if (",
        "      node instanceof Function || node instanceof NodejsFunction || node instanceof PythonFunction",
        "    ) {",
        "      this.props.datadog.addLambdaFunctions([node]);",
        "      if (this.props.datadogApiSecretArn) {",
        "        (node as Function).addToRolePolicy(new Secretsmanager()",
        "          .allow()",
        "          .toGetSecretValue()",
        "          .toDescribeSecret()",
        "          .on(this.props.datadogApiSecretArn));",
        "      }",
        "    }",
        "  }",
        "}",
      }),
    }),
    snip({
      trig = "cdk-v2-stack-template",
      namr = "CDK v2 Stack Class Template",
      dscr = "Template for creating a new CDK v2 stack class",
    }, {
      text({
        "import { Stack, StackProps } from 'aws-cdk-lib';",
        "import { Construct } from 'constructs';",
        "",
        "interface ",
      }),
      func(get_filename, {}),
      text({
        "Props extends StackProps {",
        "  // Define the properties for the stack",
        "",
        "}",
        "",
        "export class ",
      }),
      func(get_filename, {}),
      text({
        " extends Stack {",
        "  constructor(scope: Construct, id: string, props?: ",
      }),
      func(get_filename, {}),
      text({
        "Props) {",
        "    super(scope, id, props);",
        "",
        "    // Define the stack resources and logic here",
        "",
        "  }",
        "}",
      }),
    }),
    snip({
      trig = "cdk-v2-construct-template",
      namr = "CDK v2 Construct Template",
      dscr = "Template for creating a new CDK v2 construct",
    }, {
      text({
        "import { Construct } from 'constructs';",
        "",
        "interface ",
      }),
      func(get_filename, {}),
      text({
        "Props {",
        "  // Define the properties for the construct",
        "",
        "}",
        "",
        "export class ",
      }),
      func(get_filename, {}),
      text({
        " extends Construct {",
        "  constructor(scope: Construct, id: string, props: ",
      }),
      func(get_filename, {}),
      text({
        "Props) {",
        "    super(scope, id);",
        "",
        "    // Define the construct logic here",
        "",
        "  }",
        "}",
      }),
    }),
    snip({
      trig = "typescript-json-replace",
      namr = "TypeScript JSON Value Replacer",
      dscr = "TypeScript function to replace values for a key in a JSON string",
    }, {
      text({
        "function replaceJsonValue(jsonString: string, key: string, replacementValue: any): string {",
        "  // Parse the JSON string into a JavaScript object",
        "  const jsonObj = JSON.parse(jsonString);",
        "",
        "  // Recursive function to traverse the object and replace values",
        "  function traverse(obj: any) {",
        "    for (const prop in obj) {",
        "      if (obj.hasOwnProperty(prop)) {",
        '        if (typeof obj[prop] === "object" && obj[prop] !== null) {',
        "          // If the property is an object, recursively traverse it",
        "          traverse(obj[prop]);",
        "        } else if (prop === key) {",
        "          // If the property matches the specified key, replace its value",
        "          obj[prop] = replacementValue;",
        "        }",
        "      }",
        "    }",
        "  }",
        "",
        "  // Start traversing the JSON object",
        "  traverse(jsonObj);",
        "",
        "  // Convert the modified object back to a JSON string",
        "  const modifiedJsonString = JSON.stringify(jsonObj);",
        "",
        "  return modifiedJsonString;",
        "}",
      }),
    }),

    snip({
      trig = "lua-love",
      namr = "Loa Love",
      dscr = "Create a love2d main.lua file skeleton",
    }, {
      text({
        "function love.load()",
        "end",
        "",
        "function love.update(dt)",
        "end",
        "",
        "function love.draw()",
        "end",
        "function love.mousepressed(x, y, button, istouch, presses)",
        "end",
      }),
    }),
    snip({
      trig = "taskfile",
      namr = "Taskfile",
      dscr = "Inserts the contents of a basic Taskfile",
    }, {
      text({
        'version:"3"',
        "",
        "tasks:",
        "  build:",
        "    cmds:",
        '      - echo "Building"',
        "  run:",
        "    cmds:",
        '      - echo "Running"',
        "  test:",
        "    cmds:",
        '      - echo "Testing"',
      }),
    }),
    snip({
      trig = "booger",
      namr = "Booger",
      dscr = "I'm a booger",
    }, {
      func(date, {}),
    }),
    snip({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown",
    }, {
      text({ "---", "title: " }),
      insert(1, "note_title"),
      text({ "", "author: " }),
      insert(2, "author"),
      text({ "", "date: " }),
      func(date, {}),
      text({ "", "categories: [" }),
      insert(3, ""),
      text({ "]", "lastmod: " }),
      func(date, {}),
      text({ "", "tags: [" }),
      insert(4),
      text({ "]", "comments: true", "---", "" }),
      insert(0),
    }),
  },
})
