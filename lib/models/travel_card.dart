class TravelCard {
  final String contry;
  final String title;
  final String image;
  final String description;
  final String rating;
  final String reviews;
  const TravelCard(
      {required this.contry,
      required this.title,
      required this.image,
      required this.description,
      required this.rating,
      required this.reviews});

  static final List<TravelCard> fakeTravelCardList = [
    TravelCard(
      contry: "Croatia",
      title: "Seafront Dubrovnik",
      image: "assets/images/card/croatia.png",
      description:
          "For luxury travel, Dubrovnik is the best choice between Split and Dubrovnik. The city boasts a selection of upscale hotels, boutique accommodations, and high-end restaurants. Many are located within the historic walls or offer panoramic vistas of the Adriatic Sea. Its exclusive amenities, such as private yacht charters, luxury spa retreats, and high-end shopping opportunities, further enhance Dubrovnik’s reputation as a luxury destination.The city’s historic charm and modern luxuries create an enticing environment for discerning travelers seeking a luxurious and indulgent getaway. While Split offers luxury accommodations, Dubrovnik’s refined atmosphere makes it the preferred destination for those seeking an unparalleled luxury travel experience.",
      rating: "4.5",
      reviews: "896",
    ),
    TravelCard(
      contry: "Singapore",
      title: "Singapore",
      image: "assets/images/card/singapore.png",
      description:
          "Singapore is a city-state that boasts a modern skyline and lush greenery. It is a melting pot of cultures, which attracts millions of visitors annually. Among Singapore’s most famous destinations is the iconic Marina Bay. In 2019, the country welcomed over 19 million visitors, confirming its status as a global destination.With a population of around 5.7 million, Singapore is a compact yet lively nation. The country prioritizes safety, which is evident from its clean streets and efficient public transport. Crime rates are notoriously low, and incidents of pickpocketing are rare, ensuring that visitors can enjoy a worry-free and secure visit to this dazzling city-state.",
      rating: "4.2",
      reviews: "1563",
    ),
    TravelCard(
      contry: "Armenia",
      title: "Armenia",
      image: "assets/images/card/armenia.png",
      description:
          "Armenia is a South Caucasus country with a rich cultural heritage, including the ancient Christian monasteries of Geghard and Etchmiadzin Cathedral. Yerevan, the capital and largest city, is one of the world’s oldest continuously inhabited cities. Also, the country boasts a low crime rate, and locals are known for their warm hospitality and willingness to assist visitors. Whether you explore the capital city, Yerevan, or venture out to other regions, you will feel safe and at ease throughout the journey. The locals are particularly respectful and welcoming towards women and are always ready to offer a helping hand to those in need.",
      rating: "4.7",
      reviews: "1025",
    ),
    TravelCard(
      contry: "Italy",
      title: "Brescia, Lombardy",
      image: "assets/images/card/italy.png",
      description:
          "As I have briefly mentioned, one of the most exciting highlights of the movie is the Mille Miglia race. The race was held 24 times from 1927 to 1957. It traversed through Modena, San Marino, Rome, Umbria, and Tuscany before finally returning to Brescia. So, it was natural that most scenes took place in this stunning city. Some of you car enthusiasts know that Ferrari is not the only race- themed movie this year, with the thrilling Gran Turismo already being in the cinemas for few months.Although Brescia is not a popular tourist destination, it has several UNESCO Heritage sites, museums, and other attractions. After some research, I was surprised that it is not among the more popular Italian destinations. With its stunning architecture and rich history, Brescia is an absolute must-visit. ",
      rating: "4.6",
      reviews: "2458",
    ),
    TravelCard(
      contry: "The United Kingdom",
      title: "Ilkley Moor",
      image: "assets/images/card/uk.png",
      description:
          "As we travel across the country, we begin in West Yorkshire in the north of England, where the crew visited Ilkley Moor. Ilkley Moor is part of Rombalds Moor, the moorland between Ilkley and Keighley, towns in the West of Yorkshire. Ilkley, Ben Rhydding, and the surrounding areas offer such rich history, making for perfect filming locations for many sets. Hence its popularity and a great reason as to why the crew decided to film there. The place is home to a legend of Rombald the Giant and how he created the Cow and Calf on Ilkley Moor. The Rocks are claimed to have been created by the mystical Rombald and his wife. Legend says that as he was running away from her during an argument, he stepped onto the rock, splitting it right in half and leaving the formation which we can now see there today.The film crew cooperated closely with the Bradford Film Office. This helped in finding locations to film in Ilkley, while working with the local council and the Countryside and Rights of Way. This ensured that all local rules and regulations were respected much like in Iceland making for a hassle-free trip.",
      rating: "4.4",
      reviews: "895",
    ),
    TravelCard(
      contry: "Vietnam",
      title: "Tokyo",
      image: "assets/images/card/vietnam.png",
      description:
          "Halong Bay (or Ha Long Bay) is also a UNESCO World Heritage Site and one of the most popular tourist attractions in Asia, making it something that you absolutely must see in Vietnam.What you’re going to want to do when you get there is take a cruise. There is no better way to enjoy the beauty of the Bay than taking a cruise trip. What this trip does is it even takes you to the most secluded parts of Halong Bay and provides you with everything you need to know about the local culture.While you’re there, a nice Hạ Long Bay resort is Vinpearl Resort & Spa Ha Long.While Halong Bay is beautiful year-round, the best time to visit is from October to April when the weather is cooler and more pleasant!",
      rating: "4.5",
      reviews: "1100",
    )
  ];
}
