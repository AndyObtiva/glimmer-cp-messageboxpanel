# Message Box Panel 0.1.0
## [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 /> Glimmer Custom Shape](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_COMMAND.md#custom-shape-gem)
[![Gem Version](https://badge.fury.io/rb/glimmer-cp-messageboxpanel.svg)](http://badge.fury.io/rb/glimmer-cp-messageboxpanel)

[Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) Message Box Panel Custom Shape.

`message_box_panel` is the [Glimmer GUI DSL](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#glimmer-gui-dsl-syntax) keyword provided by this [gem](https://rubygems.org/gems/glimmer-cp-messageboxpanel).

It is a graphical alternative to the native [`message_box`](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#message_box) widget, which is fully customizable.

### Screenshot

![message-box-panel screenshot](/screenshots/glimmer-cp-messageboxpanel-hello-message-box-panel-first.png)

![message-box-panel screenshot third](/screenshots/glimmer-cp-messageboxpanel-hello-message-box-panel-third.png)

### Actual Use

It is used in [Glimmer Quarto](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_SAMPLES.md#quarto).

![Glimmer Quarto](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/master/images/glimmer-quarto.png)

## Setup

### Bundler

Add the follwing to `Gemfile`:
```ruby
gem 'glimmer-cp-messageboxpanel', '~> 0.1.0'
```

Run `bundle install` or `bundle`:
```
bundle
```

### Direct

Run:
```
gem install glimmer-cp-messageboxpanel
```

## API

First, add this to your [Ruby](https://www.ruby-lang.org/en/) file:
```ruby
require 'glimmer-cp-messageboxpanel'
```

Then, use this keyword:
```ruby
message_box_panel(options) { properties_and_listeners }
```

Options (keyword args) are:
- `:message`
- `:location_x` (default: `:default`): `:default` value means centered horizontally within parent
- `:location_y` (default: `:default`): `:default` value means centered vertically within parent
- `:size_width` (default: `[:default, @font_height*4.0]`): default value is text width plus extra width equal to text font height multiplied by 4
- `:size_height` (default: `[:default, @font_height*4.0]`): default value is text height plus extra height equal to text font height multiplied by 4
- `:background_color` (default: `:white`): background color for text and round rectangle
- `:foreground_color` (default: `:black`): foreground color used in border
- `:border_line_width` (default: `1`): border line width
- `:text_font` (default: `{height: 12}`): text font, which has height 12 by default
- `:text_color` (default: `:black`): text color, which is black by default

## Sample

The [glimmer-cp-messageboxpanel Ruby gem](https://rubygems.org/gems/glimmer-cp-messageboxpanel) adds to glimmer samples, showing up when you run:
```
glimmer samples
```

### Hello, Message Box Panel!

[Glimmer GUI DSL](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#glimmer-gui-dsl-syntax) code (from [samples/message_box_panel/hello_message_box_panel.rb](/samples/message_box_panel/hello_message_box_panel.rb)):

```ruby
require_relative '../../lib/glimmer-cp-messageboxpanel' # Use `require 'glimmer-cp-messageboxpanel'` if gem is installed

class HelloMessageBoxPanel
  include Glimmer::UI::CustomShell
  
  body {
    shell {
      text 'Hello, Message Box Panel!'
      minimum_size 425, 200
      
      @canvas = canvas {
        background :white

        first_message_box_panel
      }
    }
  }
  
  def first_message_box_panel
    message_box_panel(message: 'Hello, Message Box Panel!', background_color: rgb(255, 255, 128), text_font: {height: 16}) {
      on_closed do
        @canvas.content { # re-open canvas content and add a message box panel
          second_message_box_panel
        }
      end
    }
  end
  
  def second_message_box_panel
    message_box_panel(message: "Message Box Panel is a graphical\nversion of the native Message Box", background_color: :cyan, text_font: {height: 16}, border_line_width: 3) {
      on_closed do
        @canvas.content { # re-open canvas content and add a message box panel
          third_message_box_panel
        }
      end
    }
  end
  
  def third_message_box_panel
    message_box_panel(message: "It is a customizable alternative that can\n be used in Canvas-based applications", background_color: :yellow, foreground_color: :red, text_color: :dark_green, text_font: {height: 16, style: [:bold, :italic]}, border_line_width: 3) {
      on_closed do
        @canvas.content { # re-open canvas content and add a message box panel
          fourth_message_box_panel
        }
      end
    }
  end
  
  def fourth_message_box_panel
    message_box_panel(message: 'Good bye, Message Box Panel!', background_color: :black, text_color: :white, text_font: {height: 16}) {
      on_closed do
        @canvas.content { # re-open canvas content and add a message box panel
          first_message_box_panel
        }
      end
    }
  end
end

HelloMessageBoxPanel.launch
```

Hello, Message Box Panel!

![Hello Message Box Panel](/screenshots/glimmer-cp-messageboxpanel-hello-message-box-panel-first.png)

![Hello Message Box Panel second](/screenshots/glimmer-cp-messageboxpanel-hello-message-box-panel-second.png)

![Hello Message Box Panel third](/screenshots/glimmer-cp-messageboxpanel-hello-message-box-panel-third.png)

![Hello Message Box Panel fourth](/screenshots/glimmer-cp-messageboxpanel-hello-message-box-panel-fourth.png)

## Contributing

-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   Commit and push until you are happy with your contribution.
-   Make sure to add tests for it. This is important so I don't break it
    in a future version unintentionally.
-   Please try not to mess with the Rakefile, version, or history. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## TODO

If you need new features or spot things that need to be fixed or improved, please [report in an Issue](https://github.com/AndyObtiva/glimmer-cp-messageboxpanel/issues/new) or [submit a Pull Request](https://github.com/AndyObtiva/glimmer-cp-messageboxpanel/compare).

[TODO.md](/TODO.md)

## Change Log

[CHANGELOG.md](/CHANGELOG.md)

## License

[MIT](LICENSE.txt)

Copyright (c) 2022 - Andy Maleh.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built for [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) (JRuby Desktop Development GUI Framework).
