local ls = require 'luasnip'
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function()
  return { os.date '%Y-%m-%d' }
end

ls.add_snippets(nil, {
  all = {

    snip({
      trig = 'typescript-json-replace',
      namr = 'TypeScript JSON Value Replacer',
      dscr = 'TypeScript function to replace values for a key in a JSON string',
    }, {
      text {
        'function replaceJsonValue(jsonString: string, key: string, replacementValue: any): string {',
        '  // Parse the JSON string into a JavaScript object',
        '  const jsonObj = JSON.parse(jsonString);',
        '',
        '  // Recursive function to traverse the object and replace values',
        '  function traverse(obj: any) {',
        '    for (const prop in obj) {',
        '      if (obj.hasOwnProperty(prop)) {',
        '        if (typeof obj[prop] === "object" && obj[prop] !== null) {',
        '          // If the property is an object, recursively traverse it',
        '          traverse(obj[prop]);',
        '        } else if (prop === key) {',
        '          // If the property matches the specified key, replace its value',
        '          obj[prop] = replacementValue;',
        '        }',
        '      }',
        '    }',
        '  }',
        '',
        '  // Start traversing the JSON object',
        '  traverse(jsonObj);',
        '',
        '  // Convert the modified object back to a JSON string',
        '  const modifiedJsonString = JSON.stringify(jsonObj);',
        '',
        '  return modifiedJsonString;',
        '}',
      },
    }),

    snip({
      trig = 'lua-love',
      namr = 'Loa Love',
      dscr = 'Create a love2d main.lua file skeleton',
    }, {
      text {
        'function love.load()',
        'end',
        '',
        'function love.update(dt)',
        'end',
        '',
        'function love.draw()',
        'end',
        'function love.mousepressed(x, y, button, istouch, presses)',
        'end',
      },
    }),

    snip({
      trig = 'booger',
      namr = 'Booger',
      dscr = "I'm a booger",
    }, {
      func(date, {}),
    }),
    snip({
      trig = 'meta',
      namr = 'Metadata',
      dscr = 'Yaml metadata format for markdown',
    }, {
      text { '---', 'title: ' },
      insert(1, 'note_title'),
      text { '', 'author: ' },
      insert(2, 'author'),
      text { '', 'date: ' },
      func(date, {}),
      text { '', 'categories: [' },
      insert(3, ''),
      text { ']', 'lastmod: ' },
      func(date, {}),
      text { '', 'tags: [' },
      insert(4),
      text { ']', 'comments: true', '---', '' },
      insert(0),
    }),
  },
})
