json.array!(@rounds) do |round|
  json.extract! round, :POpening, :DOpening, :PDirectAtt, :PDirectWit, :DCrossWit, :PCrossWit, :PClose, :DClose
  json.url round_url(round, format: :json)
end