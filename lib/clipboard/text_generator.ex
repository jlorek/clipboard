# thanks!
# https://gist.github.com/coryodaniel/d5e8fa15b3d1fe566b3c3f821225936e
defmodule Clipboard.TextGenerator do
  @adjectives ~w(
    autumn hidden bitter misty silent empty dry dark summer
    icy delicate quiet white cool spring winter patient
    twilight dawn crimson wispy weathered blue billowing
    broken cold damp falling frosty green long late lingering
    bold little morning muddy old red rough still small
    sparkling throbbing shy wandering withered wild black
    young holy solitary fragrant aged snowy proud floral
    restless divine polished ancient purple lively nameless
  )

  @nouns ~w(
    fellow dreamer thinker
    waterfall river breeze moon rain wind sea morning
    snow lake sunset pine shadow leaf dawn glitter forest
    hill cloud meadow sun glade bird brook butterfly
    bush dew dust field fire flower firefly feather grass
    haze mountain night pond darkness snowflake silence
    sound sky shape surf thunder violet water wildflower
    wave water resonance sun wood dream cherry tree fog
    frost voice paper frog smoke star hamster
  )

  @things ~w(
    notes notepad ideas thoughts clipboard
  )

  def generate_name() do
    adjective = @adjectives |> Enum.random()
    noun = @nouns |> Enum.random()
    "#{adjective} #{noun}"
  end

  def generate_title() do
    generate_name() |> generate_title()
  end

  def generate_title(name) do
    thing = @things |> Enum.random()
    "a #{name}'s #{thing}"
  end
end
