defmodule TasksMother do
  @moduledoc false

  def generate_random_tasks do
    num_tasks = Enum.random(30..200)
    (1..num_tasks)
    |> Enum.map(fn _ -> generate_random_task() end)
  end

  defp generate_random_task do
    id = UUID.uuid4()
    datetime = DateTime.to_string(DateTime.utc_now())
    done = Enum.random([true, false])
    num_adjectives = Enum.random(1..5)

    verb = Enum.random(action_verbs())
    adj = Enum.map(1..num_adjectives, fn _ -> Enum.random(adjectives()) end)
          |> Enum.uniq
          |> Enum.join(", ")
    noun = Enum.random(nouns())
    description = verb <> " the " <> adj <> " " <> noun

    %TodoTask{id: id, created_at: datetime, description: description, done: done}
  end

  defp action_verbs do
    [
      "Act",
      "Agree",
      "Arrive",
      "Ask",
      "Bake",
      "Bring",
      "Build",
      "Buy",
      "Call",
      "Climb",
      "Close",
      "Come",
      "Cry",
      "Dance",
      "Dream",
      "Drink",
      "Eat",
      "Enter",
      "Exit",
      "Fall",
      "Fix",
      "Give",
      "Go",
      "Grab",
      "Help",
      "Hit",
      "Hop",
      "Insult",
      "Joke",
      "Jump",
      "Kick",
      "Laugh",
      "Leave",
      "Lift",
      "Listen",
      "Make",
      "March",
      "Move",
      "Nod",
      "Open",
      "Play",
      "Push",
      "Read",
      "Ride",
      "Run",
      "Send",
      "Shout",
      "Sing",
      "Sit",
      "Smile",
      "Spend",
      "Stand",
      "Talk",
      "Think",
      "Throw",
      "Touch",
      "Turn",
      "Visit",
      "Vote",
      "Wait",
      "Walk",
      "Write",
      "Yell",
    ]
  end

  defp adjectives do
    [
      "able",
      "bad",
      "best",
      "better",
      "big",
      "black",
      "certain",
      "clear",
      "different",
      "early",
      "easy",
      "economic",
      "federal",
      "free",
      "full",
      "good",
      "great",
      "hard",
      "high",
      "human",
      "important",
      "international",
      "large",
      "late",
      "little",
      "local",
      "long",
      "low",
      "major",
      "military",
      "national",
      "new",
      "old",
      "only",
      "other",
      "political",
      "possible",
      "public",
      "real",
      "recent",
      "right",
      "small",
      "social",
      "special",
      "strong",
      "sure",
      "true",
      "white",
      "whole",
      "young",
    ]
  end

  defp nouns do
    [
      "area",
      "book",
      "business",
      "case",
      "child",
      "company",
      "country",
      "day",
      "eye",
      "fact",
      "family",
      "government",
      "group",
      "hand",
      "home",
      "job",
      "life",
      "lot",
      "man",
      "money",
      "month",
      "mother",
      "Mr",
      "night",
      "number",
      "part",
      "people",
      "place",
      "point",
      "problem",
      "program",
      "question",
      "right",
      "room",
      "school",
      "state",
      "story",
      "student",
      "study",
      "system",
      "thing",
      "time",
      "water",
      "way",
      "week",
      "woman",
      "word",
      "work",
      "world",
      "year",
    ]
  end
end
