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

-- Function to convert multiline string to array
local function multiline_to_array(str)
  local lines = {}
  for line in str:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end
  return lines
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
      trig = "typescript-class-template",
      namr = "Typescript Class Template",
      dscr = "Template for creating Typescript Class using my favorite pattern",
    }, {
      text({
        "interface ",
      }),
      func(get_filename, {}),
      text({
        "Props {",
        "  // Define the properties for the constructor",
        "",
        "}",
        "",
        "export class ",
      }),
      func(get_filename, {}),
      text({
        " {",
        "  constructor(props: ",
      }),
      func(get_filename, {}),
      text({
        "Props) {",
        "    // Define the constructor logic here",
        "",
        "  }",
        "}",
      }),
    }),
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
        "version: '3'",
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
    -- New multiline string snippet
    snip({
      trig = "cdk-workflows-typescript",
      namr = "CDK Workflows TypeScript",
      dscr = "CDK Workflows TypeScript",
    }, {
      text(multiline_to_array([==[
import { execSync } from 'child_process';
import { AwsCdkTypeScriptApp } from 'projen/lib/awscdk';
import { GithubWorkflow } from 'projen/lib/github';
import { JobPermission, JobStep } from 'projen/lib/github/workflows-model';

const githubActionsAwsCredentialsVersion = 'v4';
const githubActionsCheckoutVersion = 'v4';
const githubActionsTokenVersion = 'v2';
const githubActionsSetupNodeVersion = 'v4';
const nodeVersion = '20.x';
const githubActionsScriptVersion = 'v6';

export const detectStacks = (): string[] => {
  try {
    const cdkListOutput = execSync('yarn cdk list', { encoding: 'utf-8' });
    const lines = cdkListOutput.trim().split('\n');

    // Filter out non-stack lines
    const stacks = lines.filter(line =>
      !line.startsWith('yarn run') &&
      !line.startsWith('$') &&
      !line.startsWith('Done in') &&
      line.trim() !== '',
    );

    // console.log('Detected stacks:', stacks);
    return stacks;
  } catch (error) {
    console.error('Error detecting stacks:', error);
    return [];
  }
};

// Function to check if in the code owners file to deploy
export const checkCodeOwnersProd = (): JobStep[] => [
  {
    name: 'Check CODEOWNERS for prod stacks',
    id: 'check-prod',
    if: "contains('deploy-${stackName}', 'prod')",
    env: {
      GITHUB_TOKEN: '${{ steps.generate-token-prod.outputs.token }}',
    },
    run: `
      CODEOWNERS_FILE=$(cat CODEOWNERS)
      AUTHOR=$(echo \${{ github.actor }})
      OWNER=$(echo "$CODEOWNERS_FILE" | grep "prod-only-deployers" | awk '{print $NF}')
      
      if [ -z "$OWNER" ]; then
          echo "No owner found for \${{ github.event.inputs.environment }} environment"
          exit 1
      fi

      USER="\${{ github.actor }}"
          
      # Check if the owner is a direct user mention
      if [ "$OWNER" == "@$USER" ]; then
        echo "User $USER is directly mentioned in CODEOWNERS"
        exit 0
      fi

      # Check if the owner is a team
      if [[ "$OWNER" == @*/* ]]; then
        # Remove the @ symbol and split org/team
        TEAM=\${OWNER#@}
        ORG=\${TEAM%%/*}
        TEAM=\${TEAM#*/}
      
        echo "/orgs/$ORG/teams/$TEAM/memberships/$USER"

        if gh api "/orgs/$ORG/teams/$TEAM/memberships/$USER" --silent; then
          echo "User $USER is a member of team $OWNER"
            exit 0
        fi
      fi
          
      echo "User $USER is not authorized according to CODEOWNERS"
      exit 1
    `,
  },
];

export const checkCodeOwnersNonProd = (): JobStep[] => [
  {
    name: 'Check CODEOWNERS for non-prod stacks',
    id: 'check-non-prod',
    if: "!contains('deploy-${stackName}', 'prod')",
    env: {
      GITHUB_TOKEN: '${{ steps.generate-token.outputs.token }}',
    },
    run: `
      CODEOWNERS_FILE=$(cat CODEOWNERS)
      AUTHOR=$(echo \${{ github.actor }})
      OWNER=$(echo "$CODEOWNERS_FILE" | grep "non-prod-deployers" | awk '{print $NF}')
      if [ -z "$OWNER" ]; then
          echo "No owner found for \${{ github.event.inputs.environment }} environment"
          exit 1
      fi

      USER="\${{ github.actor }}"
          
      # Check if the owner is a direct user mention
      if [ "$OWNER" == "@$USER" ]; then
        echo "User $USER is directly mentioned in CODEOWNERS"
        exit 0
      fi

      # Check if the owner is a team
      if [[ "$OWNER" == @*/* ]]; then
        # Remove the @ symbol and split org/team
        TEAM=\${OWNER#@}
        ORG=\${TEAM%%/*}
        TEAM=\${TEAM#*/}
           
        echo "/orgs/$ORG/teams/$TEAM/memberships/$USER"
        
        if gh api "/orgs/$ORG/teams/$TEAM/memberships/$USER" --silent; then
          echo "User $USER is a member of team $OWNER"
            exit 0
        fi
      fi
          
      echo "User $USER is not authorized according to CODEOWNERS"
      exit 1
    `,
  },
];

// Function to run `cdk diff` for a given stack and capture its output
export const runCdkDiffForStack = (stack: string): JobStep[] => [
  {
    name: `Run CDK Diff for ${stack}`,
    id: `cdk_diff_${stack}`,
    run: `yarn cdk diff ${stack} > ${stack}.output.txt`,
  },
  {
    name: `Read CDK Diff Output for ${stack}`,
    id: `read_diff_${stack}`,
    run: `cat ${stack}.output.txt`,
  },
];

// Function to post the output of `cdk diff` as a comment using GitHub Script
export const postCdkDiffCommentForStack = (stack: string): JobStep[] => [
  {
    name: `Post CDK Diff Comment for ${stack}`,
    uses: `actions/github-script@${githubActionsScriptVersion}`,
    with: {
      'github-token': '${{ secrets.GITHUB_TOKEN }}',
      'script': `
        const fs = require('fs');
        const diffOutput = fs.readFileSync('${stack}.output.txt', 'utf8');
        github.rest.issues.createComment({
          issue_number: context.issue.number,
          owner: context.repo.owner,
          repo: context.repo.repo,
          body: \`#### ${stack} cdk diff \\\`success\\\`
<details><summary>Show \\\`cdk diff\\\` Output</summary>

\\\`\\\`\\\`
\${diffOutput}
\\\`\\\`\\\`

</details>\`
        });     
      `,
    },
  },
];

// Function to generate a GitHub token
export const generateGitHubToken = (): JobStep[] => [
  {
    name: 'Generate GitHub Token',
    id: 'generate-token',
    uses: `tibdex/github-app-token@${githubActionsTokenVersion}`,
    with: {
      app_id: '${{ secrets.PROJEN_APP_ID }}',
      private_key: '${{ secrets.PROJEN_APP_PRIVATE_KEY }}',
    },
  },
];

// Function to create common job steps
const createCommonJobSteps = (): JobStep[] => [
  { uses: `actions/checkout@${githubActionsCheckoutVersion}` },
  {
    uses: `actions/setup-node@${githubActionsSetupNodeVersion}`,
    with: {
      'node-version': `${nodeVersion}`,
    },
  },
  { run: 'yarn install --frozen-lockfile' },
];

// Function to create a workflow for a specific stack
export const createStackWorkflow = (project: AwsCdkTypeScriptApp, stackName: string) => {
  const diffDeployWorkflow = new GithubWorkflow(project.github!, `diff-deploy-${stackName}`);
  diffDeployWorkflow.on({
    push: {
      branches: ['**'],
    },
    workflowDispatch: {
      inputs: {
        diffStack: {
          description: 'Stack to deploy',
          required: true,
          type: 'choice',
          options: `diff-${stackName}`,
        },
        deployStack: {
          description: 'Stack to deploy',
          required: true,
          type: 'choice',
          options: `deploy-${stackName}`,
        },
      },
    },
    pullRequest: {
      types: ['opened', 'synchronize', 'reopened', 'labeled'],
    },
  });

  diffDeployWorkflow.addJobs({
    diff: {
      runsOn: ['ubuntu-latest'],
      if: `github.event_name == 'workflow_dispatch' || contains(github.event.pull_request.labels.*.name, 'diff-${stackName}') || github.event.label.name == 'diff-${stackName}'`,
      permissions: {
        idToken: JobPermission.WRITE,
        contents: JobPermission.READ,
        issues: JobPermission.WRITE,
        pullRequests: JobPermission.WRITE,
        repositoryProjects: JobPermission.WRITE,
      },
      steps: [
        ...createCommonJobSteps(),
        {
          uses: `aws-actions/configure-aws-credentials@${githubActionsAwsCredentialsVersion}`,
          with: {
            'role-to-assume': '${{ secrets.AWS_GITHUB_OIDC_ROLE}}',
            'aws-region': 'us-east-2', // Adjust this if your stack uses a different region
          },
        },
        ...runCdkDiffForStack(stackName),
        ...postCdkDiffCommentForStack(stackName),
      ],
    },
    deploy: {
      needs: ['diff'],
      runsOn: ['ubuntu-latest'],
      if: `contains(github.event.pull_request.labels.*.name, 'deploy-${stackName}') || github.event.label.name == 'deploy-${stackName}' || (github.event_name == 'workflow_dispatch')`,
      permissions: {
        idToken: JobPermission.WRITE,
        contents: JobPermission.READ,
      },
      steps: [
        ...createCommonJobSteps(),
        ...generateGitHubToken(),
        ...checkCodeOwnersProd(),
        ...checkCodeOwnersNonProd(),
        {
          uses: `aws-actions/configure-aws-credentials@${githubActionsAwsCredentialsVersion}`,
          with: {
            'role-to-assume': '${{ secrets.AWS_GITHUB_OIDC_ROLE }}',
            'aws-region': 'us-east-2', // Adjust this if your stack uses a different region
          },
        },
        { run: `yarn cdk deploy ${stackName} --require-approval never` },
      ],
    },
  });
};
      ]==])),
    }),
  },
})
