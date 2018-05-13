def solution(input, markers)
  input.gsub(/\s+[#{markers.join}].*/, '')
end