defmodule Clipboard.SloganGenerator do
  # Thanks!
  # https://www.oberlo.de/tools/slogan-generator

  @slogans [
    "Stimulation For Body And <%= what %>.",
    "The American Way Of <%= what %>.",
    "Two Hours Of <%= what %> In Just Two Calories.",
    "Do You Have The <%= what %> Inside?",
    "That's Handy, Harry! Stick It In The <%= what %>.",
    "I Learned It By Watching <%= what %>!",
    "There's First Love, And There's <%= what %> Love.",
    "With A Name Like <%= what %>, It Has To Be Good.",
    "I Quit Smoking With <%= what %>.",
    "<%= what %> Will Make You Feel Better.",
    "<%= what %> Is Better Than Chocolate.",
    "Make The World A Better Place With <%= what %>.",
    "Don't Get Mad, Get <%= what %>.",
    "Have You Forgotten How Good <%= what %> Tastes?",
    "Australians Wouldn't Give A <%= what %> For Anything Else.",
    "The Art Of <%= what %>.",
    "To <%= what %>, Or Not To <%= what %>.",
    "Double The Pleasure, Double The <%= what %>.",
    "Can You Feel <%= what %>?",
    "Pride Of The <%= what %> For Over A Hundred Years.",
    "<%= what %> Empowers You.",
    "Feel The Magic Of <%= what %>.",
    "You Can Do It When You <%= what %> It.",
    "A Nice Shiny New <%= what %>.",
    "<%= what %> Food For The Soul.",
    "All You Add Is <%= what %>.",
    "<%= what %> Will Live On Forever.",
    "A Radical New <%= what %>.",
    "Happiness Is <%= what %>-Shaped.",
    "I'd Like To Buy The World A <%= what %>.",
    "It Takes A Tough Man To Make A Tender <%= what %>.",
    "Where <%= what %> Is A Pleasure.",
    "<%= what %>, You Can't Live Without It.",
    "Please Don't Squeeze The <%= what %>.",
    "<%= what %>, The Freshmaker.",
    "The <%= what %> That Refreshes.",
    "<%= what %> Won't Hurt That Bad.",
    "Don't Leave Home Without <%= what %>.",
    "Life's Beautiful With <%= what %>.",
    "<%= what %>, The Original.",
    "Good <%= what %> Has Danish Written All Over It.",
    "<%= what %> One Size Fits All.",
    "<%= what %> Gets The Job Done.",
    "Doing It Right Before Your <%= what %>.",
    "Exceedingly Good <%= what %>.",
    "<%= what %> Keeps Going And Going.",
    "<%= what %> Will Get You More Girls.",
    "Long Live <%= what %>.",
    "The <%= what %> People.",
    "Let The <%= what %> Take The Strain.",
    "<%= what %>, Your Family Will Love You.",
    "Don't You Just Love Being In <%= what %>?",
    "<%= what %>: The Other White Meat.",
    "When You've Got <%= what %>, Flaunt It.",
    "Top Breeders Recommend <%= what %>.",
    "I've Seen The Future, And It's <%= what %>-Shaped.",
    "Smart. Beautiful. <%= what %>.",
    "Lightening The <%= what %>.",
    "<%= what %> Is Back.",
    "I'd Do Anything For <%= what %>.",
    "<%= what %> Gives Wealth And Beauty.",
    "It Must Be <%= what %>.",
    "Say It With <%= what %>.",
    "<%= what %> For A Better Future.",
    "It's A Beautiful <%= what %>.",
    "Men Can't Help Acting On <%= what %>.",
    "<%= what %> New And Improved.",
    "The <%= what %> Of Paradise.",
    "Thank <%= what %> It's Friday.",
    "The Gods Made <%= what %>.",
    "<%= what %> Opens The Flood Gates.",
    "<%= what %> Makes You Sexy!",
    "<%= what %> Nonstop.",
    "Made In Scotland From <%= what %>.",
    "Two <%= what %> Are Better Than One.",
    "This <%= what %>? You Bet!",
    "To Our Members, We're The Fourth <%= what %>.",
    "Let's Face The Music And <%= what %>.",
    "<%= what %> The Only Solution.",
    "<%= what %> - One Name. One Legend.",
    "Obey Your <%= what %>.",
    "All You Need Is <%= what %>.",
    "<%= what %> The Time Is Now.",
    "Like <%= what %>. Like Never Before.",
    "A Radical New <%= what %>.",
    "<%= what %> Rocks.",
    "Hhmmmmm... <%= what %>.",
    "A Tough <%= what %> To Follow.",
    "Dude, You're Getting A <%= what %>!",
    "<%= what %>, Let The Good Times Roll.",
    "<%= what %>, Where Success Is At Home.",
    "<%= what %> Keep It Coming.",
    "I'm Not Gonna Pay A Lot For This <%= what %>.",
    "Something Special In The <%= what %>.",
    "<%= what %> Wanted.",
    "You Wouldn't Want To Miss <%= what %>.",
    "<%= what %> For All Time.",
    "<%= what %> A Cut Above The Rest.",
    "<%= what %> When Only The Best Will Do.",
    "<%= what %> Only If You Want The Best.",
    "Australians Wouldn't Give A <%= what %> For Anything Else.",
    "Let The <%= what %> Begin.",
    "Pride Of The <%= what %> For Over A Hundred Years.",
    "I Trust <%= what %>.",
    "When The Going Gets Tough, The Tough Get <%= what %>.",
    "<%= what %> Is The Only Way To Be Happy.",
    "Buy <%= what %> Now!",
    "No Need To Worry With <%= what %>.",
    "The Joy Of <%= what %>.",
    "Me And My <%= what %>.",
    "<%= what %> Is My Sport.",
    "Get Busy With The <%= what %>.",
    "I Wish I Had A <%= what %>.",
    "Welcome To <%= what %> Country.",
    "<%= what %> For A Better Future.",
    "Everyone Wants A <%= what %>.",
    "I Wish They All Could Be <%= what %> Girls.",
    "Easy <%= what %>.",
    "Hope It's <%= what %>, It's <%= what %>, We Hope It's <%= what %>...",
    "Enjoy <%= what %>.",
    "Don't Forget The <%= what %>, Mum.",
    "<%= what %> The Cream Of The Crop.",
    "<%= what %> It's Guaranteed.",
    "<%= what %> - Once You Have It, You Love It.",
    "Smart People Choose <%= what %>.",
    "Time For A Sharp <%= what %>.",
    "It's Shake 'N' <%= what %>, And I Helped.",
    "Lightening The <%= what %>.",
    "Because I'm Worth <%= what %>.",
    "Men Can't Help Acting On <%= what %>.",
    "<%= what %> The Clear Choice.",
    "Like <%= what %>. Like Never Before.",
    "All You Need Is A <%= what %> And A Dream.",
    "Heal The World With <%= what %>.",
    "<%= what %>, Love It Or Leave It.",
    "<%= what %>? You Bet.",
    "The Lion Goes From <%= what %> To <%= what %>.",
    "<%= what %> For All.",
    "There Ain't No Party Like A <%= what %> Party.",
    "Aaahh, <%= what %>!",
    "Just Do <%= what %>.",
    "Budee Budee, That's All <%= what %>.",
    "Smart. Beautiful. <%= what %>.",
    "You Know When It's <%= what %>.",
    "<%= what %> Groove.",
    "The Wonder Has A Name: <%= what %>.",
    "With A Name Like <%= what %>, It Has To Be Good.",
    "<%= what %> Only If You Want The Best.",
    "It's Not A Dream. <%= what %> Is Real!",
    "Maybe She's Born With It, Maybe It's <%= what %>.",
    "151 Countries, One <%= what %>.",
    "<%= what %> Moments.",
    "Where Is Your <%= what %>?",
    "They Drink <%= what %> In The Congo.",
    "Who Wouldn't Fight For <%= what %>?",
    "This Is The Age Of The <%= what %>.",
    "Lightening The <%= what %>.",
    "You Deserve A <%= what %> Today.",
    "Have A Break, Have A <%= what %>.",
    "<%= what %> Is Back.",
    "<%= what %>, Your Specialist.",
    "<%= what %>, How Did You Live Without It?",
    "<%= what %> Not Included.",
    "<%= what %> It's Guaranteed.",
    "Thanks <%= what %>.",
    "Hey, Have You Tried <%= what %>?",
    "Funky <%= what %>.",
    "Where The Hell Is <%= what %>?",
    "<%= what %> Is Everything You Need.",
    "Let's <%= what %>!",
    "Halleluja, It's A <%= what %>.",
    "<%= what %> On The Outside, Tasty On The Inside.",
    "Now With 50% More <%= what %>!",
    "<%= what %> Beams With Quality.",
    "Nobody Better Lay A Finger On My <%= what %>.",
    "Sweet As The Moment When The <%= what %> Went 'Pop'",
    "The <%= what %> Effect.",
    "Smart People Choose <%= what %>.",
    "Always The Real Thing, Always <%= what %>.",
    "<%= what %> Comes To Those Who Wait.",
    "Lipsmackin' Thirstquenchin' Acetastin' Motivatin' Goodbuzzin' Cooltalkin' Highwalkin' Fastlivin' Evergivin' Coolfizzin' <%= what %>.",
    "Go To Work On A <%= what %>.",
    "<%= what %> - Xtending Service.",
    "Does She Or Doesn't She? Only Her <%= what %> Knows For Sure.",
    "I Feel Like <%= what %> Tonight.",
    "Jesus Loves <%= what %>.",
    "For A Fresh Change Try <%= what %>.",
    "My Anti-Drug Is <%= what %>.",
    "It Must Be <%= what %>.",
    "It's Not TV. It's <%= what %>.",
    "It's Shake 'N' <%= what %>, And I Helped.",
    "Look For The <%= what %> Label.",
    "Whenever There's A Snack Gap, <%= what %> Fits.",
    "Stop. Go. <%= what %>.",
    "Life's Beautiful With <%= what %>.",
    "The Dirt Says Hot, The Label Says <%= what %>.",
    "<%= what %>, Pure Lust.",
    "<%= what %>, Created By Nature.",
    "3... 2... 1... <%= what %>.",
    "Ho Ho Ho, Green <%= what %>.",
    "Get <%= what %> Before Your Friend Does.",
    "The Real Smell Of <%= what %>.",
    "<%= what %> Never Lies.",
    "<%= what %> Have Another Serving.",
    "Wow! I Could Have Had A <%= what %>!",
    "Leggo My <%= what %>!",
    "<%= what %> When You're Out Of Time.",
    "I Liked The <%= what %> So Much, I Bought The Company!",
    "Silly Rabbit, <%= what %> Is For Kids.",
    "Have You Forgotten How Good <%= what %> Tastes?",
    "All You Need Is A <%= what %> And A Dream.",
    "I Wish I Were A <%= what %> Weiner.",
    "<%= what %> Sees All, Knows All.",
    "<%= what %> For A Better Future.",
    "All <%= what %>, All The Time.",
    "I Scream, You Scream, We All Scream For <%= what %>.",
    "Just Do <%= what %>.",
    "If You Really Want To Know, Look In The <%= what %>.",
    "Wouldn't You Like To Be A <%= what %> Too?",
    "<%= what %> - You See This Name, You Think Dirty.",
    "Naughty Little <%= what %>.",
    "Don't Worry, <%= what %> Takes Care.",
    "<%= what %> Empowers You.",
    "<%= what %> Only.",
    "<%= what %> For People Who Want More.",
    "Santa, All I Want Is <%= what %>.",
    "Which Twin Has The <%= what %>?",
    "<%= what %> Works Like Magic.",
    "<%= what %>'s Got It All!",
    "What Is <%= what %>?",
    "<%= what %> Is Scrumdelious!",
    "<%= what %> Just What The Doctor Ordered.",
    "Snap Into A <%= what %>!",
    "It's How <%= what %> Is Done.",
    "The President Buys <%= what %>.",
    "<%= what %> - See The Light!",
    "<%= what %> When 2nd Best Isn't Good Enough.",
    "Plink, Plink, <%= what %>...",
    "I Wish I Was A <%= what %>.",
    "It Could Be <%= what %>.",
    "Go Where The Winners Go - <%= what %>!",
    "<%= what %> Asks For Nothing In Return.",
    "<%= what %> Makes Everything Better.",
    "Go On, Get Your <%= what %> Out.",
    "Makes You Feel <%= what %> Again.",
    "<%= what %> Just One More Helping.",
    "Come One, Come All To <%= what %>.",
    "<%= what %>, Stay In Touch.",
    "<%= what %> 100% Guaranteed Or Your Money Back.",
    "Connect With <%= what %>.",
    "Builds Bonny <%= what %>.",
    "Go Far With <%= what %>.",
    "<%= what %> The Top Of The Heap.",
    "<%= what %> The Best Of The Litter.",
    "Oh My Goddess, It's A <%= what %>.",
    "If You Really Want To Know, Look In The <%= what %>.",
    "When It Absolutely, Positively Has To Be <%= what %> Overnight.",
    "Think Different, Think <%= what %>.",
    "You'll Never Put A Better Bit Of <%= what %> On Your Knife.",
    "Simply The Best <%= what %>.",
    "Do You, Uh, <%= what %>?",
    "<%= what %> Empowers You.",
    "Solutions For A Small <%= what %>.",
    "<%= what %>. We Build Smiles.",
    "<%= what %> Never Die.",
    "<%= what %> - Your Game.",
    "<%= what %> - Reinventing The Wheel.",
    "Where's Your <%= what %>?",
    "Things Go Better With <%= what %>.",
    "<%= what %> For Your Kids!",
    "<%= what %> Leaves The Rest Behind.",
    "We'll Leave The <%= what %> On For You.",
    "Better Living Through <%= what %>.",
    "When The Going Gets Tough, The Tough Get <%= what %>.",
    "Hhmmmmm... <%= what %>.",
    "<%= what %> When You Need Results.",
    "<%= what %>. The Power On Your Side.",
    "<%= what %> Makes Me Want To Do It Again.",
    "Our <%= what %> Beats Last Years <%= what %>.",
    "Once You Pop, You Can't Stop <%= what %>.",
    "<%= what %> Is Your Safe Place In An Unsafe World!",
    "New Thinking. New <%= what %>.",
    "My Way Is <%= what %>.",
    "<%= what %> - Play It!",
    "<%= what %> Comes To Those Who Wait.",
    "Go On, Get Your <%= what %> Out.",
    "We're Always Low <%= what %>.",
    "<%= what %> The Sign Of Success.",
    "<%= what %> Is Our Middle Name.",
    "Make Room For The <%= what %>.",
    "Make Every <%= what %> Count.",
    "Things Go Better With <%= what %>.",
    "<%= what %> - Your Personal Entertainer.",
    "Next Stop, <%= what %>.",
    "<%= what %> Have More Fun.",
    "Run For The <%= what %>.",
    "<%= what %> - It Does A Body Good.",
    "Leggo My <%= what %>!",
    "No <%= what %>, No Kiss.",
    "I Am Stuck On <%= what %>, 'Cause <%= what %>'s Stuck On Me.",
    "<%= what %> Is The Word.",
    "Does She Or Doesn't She? Only Her <%= what %> Knows For Sure.",
    "Budee Budee, That's All <%= what %>.",
    "Give The Dog A <%= what %>.",
    "<%= what %> Makes Me Happy.",
    "<%= what %> Gives Wealth And Beauty.",
    "Everything Is Simple With <%= what %>.",
    "Nothing Sucks Like A <%= what %>.",
    "We Bring <%= what %> To Life.",
    "Ho Ho Ho, Green <%= what %>.",
    "I Can't Believe I Ate The Whole <%= what %>.",
    "Happiness Is <%= what %>-Shaped.",
    "It Makes Your <%= what %> Smack.",
    "<%= what %>, To Hell With The Rest.",
    "Hand-Built By <%= what %>.",
    "Let's Face The Music And <%= what %>.",
    "<%= what %> With The Less Fattening Centres.",
    "The World's <%= what %> Marketplace.",
    "<%= what %> Is Your Friend.",
    "Cleans A Big, Big <%= what %> For Less Than Half A Crown.",
    "It's Different In A <%= what %>.",
    "Be Like Dad, Keep <%= what %>.",
    "The <%= what %> Universe.",
    "Driven By <%= what %>.",
    "People Like <%= what %>.",
    "Wouldn't You Like To Be A <%= what %> Too?",
    "Crunch All You Want. We'll Make <%= what %>.",
    "What Is <%= what %>?",
    "Come Fly The Friendly <%= what %>.",
    "<%= what %> Keeps Going And Going.",
    "We Build <%= what %>.",
    "The Top Pick... <%= what %>.",
    "And All Because The Lady Loves <%= what %>.",
    "<%= what %> Really Satisfies.",
    "Long Life <%= what %>.",
    "Our <%= what %> Will Give You Softer Skin.",
    "<%= what %> Perfection At Its Finest.",
    "<%= what %> - See The Light!",
    "<%= what %> Is There Day Or Night.",
    "You Wouldn't Want To Miss <%= what %>.",
    "Moving At The Speed Of <%= what %>.",
    "Go Farther With <%= what %>.",
    "Please Don't Squeeze The <%= what %>.",
    "Gives A Meal <%= what %>-Appeal.",
    "<%= what %> Keeps Them Coming Back",
    "Reach For The <%= what %>.",
    "Be Young, Have Fun, Drink <%= what %>.",
    "<%= what %> Get's You Where You're Going."
  ]

  def generate_slogan do
    @slogans |> Enum.random() |> EEx.eval_string(what: "Clipboard")
  end
end
