class HomeController < ApplicationController
  layout "landing", only: [:landing]

  def landing
  end

  def index
    ike = {
      pic_path: 'ike_member.jpg',
      name: 'T.J. Ike',
      instrument: 'Keys',
      instrument_info:  'Kurzweil SP88 · Kawai K-4 · Hammond Organ',
      info: "Ike has over 40 years experience working with bands and in studios. He first came to the Twin Cities in 1977 with a blues band, out of Iowa, known as The Little Red Rooster Band. In 1978 the band relocated to Minneapolis and cut an album in The Studio in St. Paul. The mixing was done by Sound 80. The title of the album was Authorized Bootleg. The band and the album did well, but the band decided to move back to Iowa where they are now known as The Blue Band.\n\nIke remained in the Twin Cities to further pursue his musical career, playing both with local projects and road bands booked out of the area. In addition to Ike's many musical talents, he also has a degree in Audio Recording from Hennepin Technical College in Eden Prairie, MN."
    }
    ellis = {
      pic_path: 'ellis_member.png',
      name: 'Tim Ellis',
      instrument: 'Drums & Percussion',
      instrument_info: nil,
      info: "Tim Ellis, a drummer from St. Paul, Minnesota, has a long history with drums. He has been playing in bands of all genres for over 35 years, while along the way collecting vintage drums. Way back when they weren't called vintage. Rumor has it, Tim opened a shop because he needed a place to store his ballooning collection.\n\nTim makes his own line of drums with the Ellis Drum Company line. Production is done right in the shop basement. Tim employs pro drummers in the shop so they know and understand things from a drummer's point of view. Friendly and quality service is a must."
    }
    jj = {
      pic_path: 'jj_member.jpg',
      name: 'James Jamar',
      instrument: 'Bassist',
      instrument_info: nil,
      info: "James has been playing on stages throughout the Midwest for over 25 years. As a bassist he values every note he plays, but knows when not to play as well. He is self-taught and through regular practice and studying with other accomplished musicians, seeks constantly to hone his skills.\n\nAs an entertainer, James is a dynamic, high energy and infectious performer. \"I love to watch you play\" and \"Man, you are really having fun up there!\" are frequent compliments give to him.\n\nJames has played in original and commercial bands as a member and a hired gun. His love of music is great enough that he hopes to be playing until his last day."
    }

    @fb_events = [
      {
        event_url: "https://www.facebook.com/cosmicfuseband/posts/946833258686036"
      }
    ]
    @members = [ike, ellis, jj]
  end
end
