require 'spec_helper'

describe Child do
  it { should have_and_belong_to_many :parents}
end

