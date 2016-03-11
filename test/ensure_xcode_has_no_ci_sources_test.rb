require 'test_helper'

class EnsureXcodeHasNoCiSourcesTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EnsureXcodeHasNoCiSources::VERSION
  end

  def test_case_insensitive_file_test
    test = EnsureXcodeHasNoCiSources::Test.new(Xcodeproj::Project.new("Sample.xcodeproj"))
    test.children["./directory"] = [Pathname("./directory/test.swift"), Pathname("./directory/Test.m"), Pathname("./directory/image.png")]

    assert_nil test.case_insensitive_file_path(Pathname("./directory/Test.m"))
    assert_equal Pathname("./directory/test.swift"), test.case_insensitive_file_path(Pathname("./directory/Test.swift"))
  end
end
