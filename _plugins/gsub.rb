# Copyright (C) 2012-2014 Scott Zeid
# http://code.s.zeid.me/site-design
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# 
# Except as contained in this notice, the name(s) of the above copyright holders
# shall not be used in advertising or otherwise to promote the sale, use or
# other dealings in this Software without prior written authorization.

module GSubFilter
 # https://github.com/Shopify/liquid/issues/202#issuecomment-19112872
 def gsub(input, regex, replacement = '', options = "")
  options_num = 0
  options_num |= Regexp::IGNORECASE if options =~ /i/i
  options_num |= Regexp::MULTILINE if options =~ /m/i
  options_num |= Regexp::EXTENDED if options =~ /x/i
  input.to_s.gsub(Regexp.new(regex, options_num), replacement.to_s)
 end
end

Liquid::Template.register_filter(GSubFilter)
