$ADJECTIVES = [
  "adamant",
  "adorable",
  "animistic",
  "arcadian",
  "benevolent",
  "calamitous",
  "candid",
  "colorful",
  "contemplative",
  "cuddly",
  "curious",
  "delicate",
  "discreet",
  "dominant",
  "dowdy",
  "energetic",
  "feisty",
  "fierce",
  "fluffy",
  "friendly",
  "fulsome",
  "fuzzy",
  "generous",
  "grumpy",
  "helpful",
  "insolent",
  "judicious",
  "luminous",
  "messy",
  "meticulous",
  "nocturnal",
  "noisy",
  "nosy",
  "persistent",
  "picky",
  "playful",
  "proud",
  "quick",
  "sarcastic",
  "sassy",
  "serene",
  "serpentine",
  "shy",
  "speedy",
  "stubborn",
  "talkative",
  "tall",
  "tame",
  "tenacious",
  "ubiquitous",
  "wild",
  "wise",
  "wordy"
]

$ANIMALS = [
  "alligator",
  "ant",
  "bear",
  "bee",
  "camel",
  "cheetah",
  "chicken",
  "chimpanzee",
  "crocodile",
  "deer",
  "dolphin",
  "duck",
  "eagle",
  "elephant",
  "fish",
  "fox",
  "frog",
  "giraffe",
  "goldfish",
  "hamster",
  "horse",
  "kangaroo",
  "kitten",
  "lion",
  "lobster",
  "monkey",
  "octopus",
  "owl",
  "panda",
  "puppy",
  "rabbit",
  "seal",
  "shark",
  "sheep",
  "snail",
  "snake",
  "spider",
  "squirrel",
  "tiger",
  "turtle",
  "wolf",
  "zebra"
]

def random_name_gen
  return "#{$ADJECTIVES.sample} #{$ANIMALS.sample}".titleize
end