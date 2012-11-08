# -*- coding: utf-8 -*-

=begin
***** BEGIN LICENSE BLOCK *****
Version: MPL 1.1

The contents of this file are subject to the Mozilla Public License Version
1.1 (the "License"); you may not use this file except in compliance with
the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,

WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
for the specific language governing rights and limitations under the
License.

The Original Code is tanasinn

The Initial Developer of the Original Code is * Hayaki Saito.
Portions created by the Initial Developer are Copyright (C) 2010 - 2011
the Initial Developer. All Rights Reserved.

***** END LICENSE BLOCK *****
=end

require 'string-width-tanasinn/regexp'

module StringWidth
  module Tanasinn
    def self.wcwidth_amb_as_single(s)
      raise ArgumentError unless s.size == 1
      c = s.ord
      case
      when c < 0x10000
        case s
        when RE_AMB_AS_SINGLE_2
          2
        when RE_WIDTH_0_CHARS
          0
        end
      when c < 0x1F100
        1
      when c < 0x1F300
        case
        when ARY_AMB_AS_SINGLE_1.include?(c)
          1
        else
          2
        end
      when c < 0x20000
        1
      when c < 0xE0000
        2
      when c < 0xE1000
        1
      when c > 0xFFFFF
        1
      else
        raise RangeError "codepoint out of range"
      end or 1
    end

    def self.wcwidth_amb_as_double(s)
      raise ArgumentError unless s.size == 1
      c = s.ord
      case
      when c < 0x10000
        case s
        when RE_AMB_AS_DOUBLE_2
          2
        when RE_WIDTH_0_CHARS
          0
        end
      when c < 0x1F100
        1
      when c < 0x1F200
        2
      when c < 0x1F300
        2
      when c < 0x20000
        2
      when c > 0xFFFFF
        2
      else
        raise RangeError "codepoint out of range"
      end or 1
    end
  end
end
