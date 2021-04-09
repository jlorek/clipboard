defmodule Clipboard.Ids do
  @salt "national park"

  def uuid_to_hashid(uuid) do
    # "b68b030d-0aa8-4666-838c-7ec429ee9d14"
    <<first::binary-size(8), "-", second::binary-size(4), "-", third::binary-size(4), "-",
      fourth::binary-size(4), "-", fifth::binary-size(12)>> = uuid

    parts = [
      hex_to_int(first),
      hex_to_int(second),
      hex_to_int(third),
      hex_to_int(fourth),
      hex_to_int(fifth)
    ]

    hashids = Hashids.new(salt: @salt)
    Hashids.encode(hashids, parts) |> IO.inspect(label: "Encoded")
  end

  # Thanks!
  # https://stackoverflow.com/a/34405228/1010496
  defp hex_to_int(hex) do
    hex
    |> String.upcase()
    |> Base.decode16!()
    |> :binary.decode_unsigned()
  end

  def hashid_to_uuid(hashid) do
    hashids = Hashids.new(salt: @salt)

    parts =
      Hashids.decode!(hashids, hashid)
      |> IO.inspect(label: "Decoded")
      |> Enum.map(&Integer.to_string(&1, 16))

    # :*(
    [
      Enum.at(parts, 0) |> String.pad_leading(8, "0"),
      Enum.at(parts, 1) |> String.pad_leading(4, "0"),
      Enum.at(parts, 2) |> String.pad_leading(4, "0"),
      Enum.at(parts, 3) |> String.pad_leading(4, "0"),
      Enum.at(parts, 4) |> String.pad_leading(12, "0")
    ]
    |> Enum.join("-")
    |> String.downcase()
  end
end
