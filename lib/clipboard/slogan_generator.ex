defmodule Clipboard.SloganGenerator do
  # thanks!
  # https://www.oberlo.de/tools/slogan-generator

  @slogans [
    "Stimulation for body and <%= what %>.",
    "The american way of <%= what %>.",
    "Two hours of <%= what %> in just two calories.",
    "Do you have the <%= what %> inside?",
    "I learned it by watching <%= what %>!",
    "There's first love, and there's <%= what %> love.",
    "With a name like <%= what %>, it has to be good.",
    "I quit smoking with <%= what %>.",
    "<%= what %> will make you feel better.",
    "<%= what %> is better than chocolate.",
    "Make the world a better place with <%= what %>.",
    "Don't get mad, get <%= what %>.",
    "Have you forgotten how good <%= what %> tastes?",
    "Australians wouldn't give a <%= what %> for anything else.",
    "The art of <%= what %>.",
    "To <%= what %>, or not to <%= what %>.",
    "Double the pleasure, double the <%= what %>.",
    "Can you feel <%= what %>?",
    "Pride of the <%= what %> for over a hundred years.",
    "<%= what %> empowers you.",
    "Feel the magic of <%= what %>.",
    "You can do it when you <%= what %> it.",
    "a nice shiny new <%= what %>.",
    "<%= what %> food for the soul.",
    "All you add is <%= what %>.",
    "<%= what %> will live on forever.",
    "a radical new <%= what %>.",
    "Happiness is <%= what %>-Shaped.",
    "I'd like to buy the world a <%= what %>.",
    "It takes a tough man to make a tender <%= what %>.",
    "Where <%= what %> is a pleasure.",
    "<%= what %>, you can't live without it.",
    "Please don't squeeze the <%= what %>.",
    "<%= what %>, the freshmaker.",
    "The <%= what %> that refreshes.",
    "<%= what %> won't hurt that bad.",
    "Don't leave home without <%= what %>.",
    "Life's beautiful with <%= what %>.",
    "<%= what %>, the original.",
    "Good <%= what %> has danish written all over it.",
    "<%= what %> one size fits all.",
    "<%= what %> gets the job done.",
    "Doing it right before your <%= what %>.",
    "Exceedingly good <%= what %>.",
    "<%= what %> keeps going and going.",
    "<%= what %> will get you more girls.",
    "Long live <%= what %>.",
    "The <%= what %> people.",
    "Let the <%= what %> take the strain.",
    "<%= what %>, your family will love you.",
    "Don't you just love being in <%= what %>?",
    "<%= what %>: the other white meat.",
    "When you've got <%= what %>, flaunt it.",
    "Top breeders recommend <%= what %>.",
    "I've seen the future, and it's <%= what %>-shaped.",
    "Smart. beautiful. <%= what %>.",
    "Lightening the <%= what %>.",
    "<%= what %> is back.",
    "I'd do anything for <%= what %>.",
    "<%= what %> gives wealth and beauty.",
    "It must be <%= what %>.",
    "Say it with <%= what %>.",
    "<%= what %> for a better future.",
    "It's a beautiful <%= what %>.",
    "Men can't help acting on <%= what %>.",
    "<%= what %> new and improved.",
    "The <%= what %> of paradise.",
    "Thank <%= what %> it's friday.",
    "The gods made <%= what %>.",
    "<%= what %> opens the flood gates.",
    "<%= what %> makes you sexy!",
    "<%= what %> nonstop.",
    "Made in scotland from <%= what %>.",
    "Two <%= what %> are better than one.",
    "This <%= what %>? you bet!",
    "To our members, we're the fourth <%= what %>.",
    "Let's face the music and <%= what %>.",
    "<%= what %> the only solution.",
    "<%= what %> - one name. one legend.",
    "Obey your <%= what %>.",
    "All you need is <%= what %>.",
    "<%= what %> the time is now.",
    "Like <%= what %>. Like never before.",
    "A radical new <%= what %>.",
    "<%= what %> rocks.",
    "Hhmmmmm... <%= what %>.",
    "A tough <%= what %> to follow.",
    "Dude, you're getting a <%= what %>!",
    "<%= what %>, let the good times roll.",
    "<%= what %>, where success is at home.",
    "<%= what %> keep it coming.",
    "I'm not gonna pay a lot for this <%= what %>.",
    "Something special in the <%= what %>.",
    "<%= what %> wanted.",
    "You wouldn't want to miss <%= what %>.",
    "<%= what %> for all time.",
    "<%= what %> a cut above the rest.",
    "<%= what %> when only the best will do.",
    "<%= what %> only if you want the best.",
    "Australians wouldn't give a <%= what %> for anything else.",
    "Let the <%= what %> begin.",
    "Pride of the <%= what %> for over a hundred years.",
    "I trust <%= what %>.",
    "When the going gets tough, the tough get <%= what %>.",
    "<%= what %> is the only way to be happy.",
    "No need to worry with <%= what %>.",
    "The joy of <%= what %>.",
    "Me and my <%= what %>.",
    "<%= what %> is my sport.",
    "Get busy with the <%= what %>.",
    "I wish i had a <%= what %>.",
    "Welcome to <%= what %> country.",
    "<%= what %> for a better future.",
    "Everyone wants a <%= what %>.",
    "I wish they all could be <%= what %> girls.",
    "Easy <%= what %>.",
    "Hope it's <%= what %>, it's <%= what %>, we hope it's <%= what %>...",
    "Enjoy <%= what %>.",
    "Don't forget the <%= what %>, mum.",
    "<%= what %> the cream of the crop.",
    "<%= what %> it's guaranteed.",
    "<%= what %> - once you have it, you love it.",
    "Smart people choose <%= what %>.",
    "Time for a sharp <%= what %>.",
    "It's shake 'N' <%= what %>, and i helped.",
    "Lightening the <%= what %>.",
    "Because i'm worth <%= what %>.",
    "Men can't help acting on <%= what %>.",
    "<%= what %> the clear choice.",
    "Like <%= what %>. like never before.",
    "All you need is a <%= what %> and a dream.",
    "Heal the world with <%= what %>.",
    "<%= what %>, love it or leave it.",
    "<%= what %>? you bet.",
    "The lion goes from <%= what %> to <%= what %>.",
    "<%= what %> for all.",
    "There ain't no party like a <%= what %> party.",
    "Aaahh, <%= what %>!",
    "Just do <%= what %>.",
    "Budee budee, that's all <%= what %>.",
    "Smart. beautiful. <%= what %>.",
    "You know when it's <%= what %>.",
    "<%= what %> groove.",
    "The wonder has a name: <%= what %>.",
    "With a name like <%= what %>, it has to be good.",
    "<%= what %> only if you want the best.",
    "It's not a dream. <%= what %> is real!",
    "Maybe she's born with it, maybe it's <%= what %>.",
    "151 countries, one <%= what %>.",
    "<%= what %> moments.",
    "Where is your <%= what %>?",
    "They drink <%= what %> in the congo.",
    "Who wouldn't fight for <%= what %>?",
    "This is the age of the <%= what %>.",
    "Lightening the <%= what %>.",
    "You deserve a <%= what %> today.",
    "Have a break, have a <%= what %>.",
    "<%= what %> is back.",
    "<%= what %>, your specialist.",
    "<%= what %>, how did you live without it?",
    "<%= what %> not included.",
    "<%= what %> it's guaranteed.",
    "Thanks <%= what %>.",
    "Hey, have you tried <%= what %>?",
    "Funky <%= what %>.",
    "Where the hell is <%= what %>?",
    "<%= what %> is everything you need.",
    "Let's <%= what %>!",
    "Halleluja, it's a <%= what %>.",
    "<%= what %> on the outside, tasty on the inside.",
    "Now with 50% more <%= what %>!",
    "<%= what %> beams with quality.",
    "Nobody better lay a finger on my <%= what %>.",
    "Sweet as the moment when the <%= what %> went 'Pop'",
    "The <%= what %> effect.",
    "Smart people choose <%= what %>.",
    "Always the real thing, always <%= what %>.",
    "<%= what %> comes to those who wait.",
    "Go to work on a <%= what %>.",
    "<%= what %> - xtending service.",
    "Does she or doesn't she? only her <%= what %> knows for sure.",
    "I feel like <%= what %> tonight.",
    "Jesus loves <%= what %>.",
    "For a fresh change try <%= what %>.",
    "My anti-Drug is <%= what %>.",
    "It must be <%= what %>.",
    "Look for the <%= what %> label.",
    "Whenever there's a snack gap, <%= what %> fits.",
    "Stop. go. <%= what %>.",
    "Life's beautiful with <%= what %>.",
    "The dirt says hot, the label says <%= what %>.",
    "<%= what %>, pure lust.",
    "<%= what %>, created by nature.",
    "3... 2... 1... <%= what %>.",
    "Get <%= what %> before your friend does.",
    "The real smell of <%= what %>.",
    "<%= what %> never lies.",
    "<%= what %> have another serving.",
    "Wow! i could have had a <%= what %>!",
    "<%= what %> when you're out of time.",
    "I liked the <%= what %> so much, i bought the company!",
    "Have you forgotten how good <%= what %> tastes?",
    "All you need is a <%= what %> and a dream.",
    "<%= what %> for a better future.",
    "All <%= what %>, all the time.",
    "I scream, you scream, we all scream for <%= what %>.",
    "Just do <%= what %>.",
    "If you really want to know, look in the <%= what %>.",
    "Wouldn't you like to be a <%= what %> too?",
    "<%= what %> - you see this name, you think dirty.",
    "Naughty little <%= what %>.",
    "Don't worry, <%= what %> takes care.",
    "<%= what %> empowers you.",
    "<%= what %> only.",
    "<%= what %> for people who want more.",
    "Santa, all i want is <%= what %>.",
    "Which twin has the <%= what %>?",
    "<%= what %> works like magic.",
    "<%= what %>'s got it all!",
    "What is <%= what %>?",
    "<%= what %> is scrumdelious!",
    "<%= what %> - just what the doctor ordered.",
    "Snap into a <%= what %>!",
    "It's how <%= what %> is done.",
    "The president buys <%= what %>.",
    "<%= what %> - see the light!",
    "<%= what %> when 2nd best isn't good enough.",
    "Plink, plink, <%= what %>...",
    "I wish i was a <%= what %>.",
    "It could be <%= what %>.",
    "Go where the winners go - <%= what %>!",
    "<%= what %> asks for nothing in return.",
    "<%= what %> makes everything better.",
    "Go on, get your <%= what %> out.",
    "Makes you feel <%= what %> again.",
    "<%= what %> just one more helping.",
    "Come one, come all to <%= what %>.",
    "<%= what %>, stay in touch.",
    "<%= what %> 100% guaranteed or your money back.",
    "Connect with <%= what %>.",
    "Builds bonny <%= what %>.",
    "Go far with <%= what %>.",
    "<%= what %> the top of the heap.",
    "<%= what %> the best of the litter.",
    "Oh my goddess, it's a <%= what %>.",
    "If you really want to know, look in the <%= what %>.",
    "When it absolutely, positively has to be <%= what %> overnight.",
    "Think different, think <%= what %>.",
    "You'll never put a better bit of <%= what %> on your knife.",
    "Simply the best <%= what %>.",
    "Do you, uh, <%= what %>?",
    "<%= what %> empowers you.",
    "Solutions for a small <%= what %>.",
    "<%= what %>. we build smiles.",
    "<%= what %> never die.",
    "<%= what %> - your game.",
    "<%= what %> - reinventing the wheel.",
    "Where's your <%= what %>?",
    "Things go better with <%= what %>.",
    "<%= what %> for your kids!",
    "<%= what %> leaves the rest behind.",
    "We'll leave the <%= what %> on for you.",
    "Better living through <%= what %>.",
    "When the going gets tough, the tough get <%= what %>.",
    "Hhmmmmm... <%= what %>.",
    "<%= what %> when you need results.",
    "<%= what %>. the power on your side.",
    "<%= what %> makes me want to do it again.",
    "Our <%= what %> beats last years <%= what %>.",
    "<%= what %> is your safe place in an unsafe world!",
    "New thinking. new <%= what %>.",
    "My way is <%= what %>.",
    "<%= what %> - play it!",
    "<%= what %> comes to those who wait.",
    "Go on, get your <%= what %> out.",
    "We're always low <%= what %>.",
    "<%= what %> the sign of success.",
    "<%= what %> is our middle name.",
    "Make room for the <%= what %>.",
    "Make every <%= what %> count.",
    "Things go better with <%= what %>.",
    "<%= what %> - your personal entertainer.",
    "Next stop, <%= what %>.",
    "<%= what %> have more fun.",
    "Run for the <%= what %>.",
    "<%= what %> - it does a body good.",
    "Leggo my <%= what %>!",
    "No <%= what %>, no kiss.",
    "I am stuck on <%= what %>, 'Cause <%= what %>'s stuck on me.",
    "<%= what %> is the word.",
    "Does she or doesn't she? only her <%= what %> knows for sure.",
    "Budee budee, that's all <%= what %>.",
    "Give the dog a <%= what %>.",
    "<%= what %> makes me happy.",
    "<%= what %> gives wealth and beauty.",
    "Everything is simple with <%= what %>.",
    "Nothing sucks like a <%= what %>.",
    "We bring <%= what %> to life.",
    "Ho ho ho, green <%= what %>.",
    "I can't believe i ate the whole <%= what %>.",
    "Happiness is <%= what %>-Shaped.",
    "It makes your <%= what %> smack.",
    "<%= what %>, to hell with the rest.",
    "Hand-Built by <%= what %>.",
    "Let's face the music and <%= what %>.",
    "<%= what %> with the less fattening centres.",
    "The world's <%= what %> marketplace.",
    "<%= what %> is your friend.",
    "Cleans a big, big <%= what %> for less than half a crown.",
    "It's different in a <%= what %>.",
    "Be like dad, keep <%= what %>.",
    "The <%= what %> universe.",
    "Driven by <%= what %>.",
    "People like <%= what %>.",
    "Wouldn't you like to be a <%= what %> too?",
    "Crunch all you want. we'll make <%= what %>.",
    "What is <%= what %>?",
    "Come fly the friendly <%= what %>.",
    "<%= what %> keeps going and going.",
    "We build <%= what %>.",
    "The top pick... <%= what %>.",
    "And all because the lady loves <%= what %>.",
    "<%= what %> really satisfies.",
    "Long life <%= what %>.",
    "Our <%= what %> will give you softer skin.",
    "<%= what %> perfection at its finest.",
    "<%= what %> - see the light!",
    "<%= what %> is there day or night.",
    "You wouldn't want to miss <%= what %>.",
    "Moving at the speed of <%= what %>.",
    "Go farther with <%= what %>.",
    "Please don't squeeze the <%= what %>.",
    "Gives a meal <%= what %>-Appeal.",
    "<%= what %> keeps them coming back",
    "Reach for the <%= what %>.",
    "Be young, have fun, drink <%= what %>.",
    "<%= what %> get's you where you're going."
  ]

  def generate_slogan do
    @slogans |> Enum.random() |> EEx.eval_string(what: "Clipboard")
  end
end
