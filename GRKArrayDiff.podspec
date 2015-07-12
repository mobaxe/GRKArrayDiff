Pod::Spec.new do |s|
  s.name         = "GRKArrayDiff"
  s.version      = "1.1"
  s.summary      = "Provides diffs between two NSArrays with details about deletions, insertions, moves, and modifications."
  s.description  = <<-DESC
Given two NSArrays, an old and current, GRKArrayDiff will report all deletions, insertions,
moves, and modifications. This is specifically targeted for array backed data models which
are used to support Table Views and Collection Views, but is generally applicable as well.
    DESC
  s.homepage     = "https://github.com/levigroker/GRKArrayDiff"
  s.license      = 'Creative Commons Attribution 3.0 Unported License'
  s.author       = { "Levi Brown" => "levigroker@gmail.com" }
  s.social_media_url = 'https://twitter.com/levigroker'
  s.source       = { :git => "https://github.com/levigroker/GRKArrayDiff.git", :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.source_files = 'GRKArrayDiff/**/*.{h,m}'
end
