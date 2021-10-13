# frozen_string_literal: true

class Hash
  def deep_copy
    Marshal.load(Marshal.dump(self))
  end
end
