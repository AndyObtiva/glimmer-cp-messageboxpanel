# Copyright (c) 2022 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
