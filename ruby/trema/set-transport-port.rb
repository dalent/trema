#
# Copyright (C) 2008-2012 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


require "trema/action"
require "trema/monkey-patch/integer"


module Trema
  #
  # A super-class of {SetTransportSrcPort} and {SetTransportDstPort} action.
  #
  class SetTransportPort < Action
    attr_reader :port_number


    #
    # @private
    #
    def initialize port_number
      error_message = "TCP/UDP port must be an unsigned 16-bit integer"
      if not port_number.is_a?( Integer )
        raise TypeError, error_message
      end
      if not port_number.unsigned_16bit?
        raise ArgumentError, error_message
      end
      @port_number = port_number
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End: