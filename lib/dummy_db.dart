class DummyDb {
  //list of new arrivals
  static const List newArrivals = [
    {
      "image":
          "https://devotedstore.com/cdn/shop/files/20.png?v=1711236919&width=1080",
      "title": "Leather Jacket",
      "price": 1200,
      "description":
          "Stylish  leather jacket with a modern fit, ideal for casual outings.",
      "rating": "4.5",
      "id": 2
    },
    {
      "image":
          "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/10617886/2023/2/21/04dd16f8-923a-497b-9797-c077374088e71676971835253-Roadster-Men-Blue-Solid-Denim-Jacket-9241676971834608-1.jpg",
      "title": "Denim Jacket",
      "price": 700,
      "description":
          "Classic black denim jacket with a distressed look, versatile for any season.",
      "rating": "4.2",
      "id": 3
    },
    {
      "image":
          "https://www.stirlingsports.co.nz/productimages/magnify/1/104727_623747_97552.jpg",
      "title": "Classic Pullover Hoodie",
      "price": 550,
      "description":
          "A classic pullover hoodie in a range of vibrant colors. Features a cozy fleece lining and adjustable drawstrings.",
      "rating": "4.5",
      "id": 4
    },
    {
      "image":
          "https://www.luvluxboutique.com/cdn/shop/files/IMG_0802_900x_45726eb5-5eb4-402d-b0a4-7ae1144f548c.webp?v=1718192989&width=1445",
      "title": "Solid Color Round-Neck T-Shirt",
      "price": 400,
      "description":
          "Elegant solid color T-shirt with a flattering V-neck design. Available in various colors and made from soft, comfortable cotton.",
      "rating": "4.5",
      "id": 5
    },
  ];
  //list of dummy products
  static const List products = [
    {
      "image":
          "https://i.pinimg.com/236x/2d/62/aa/2d62aa9a68c46c9f657867325d3620f2.jpg",
      "title": "Zip-Up Performance Hoodie",
      "price": 750,
      "description":
          "Designed for both comfort and functionality, our Zip-Up Performance Hoodie is perfect for active lifestyles. It features moisture-wicking fabric, a full-length zipper, and a sleek, modern fit. Available in a range of dynamic colors.",
      "rating": "4.7",
      "id": 6
    },
    {
      "image":
          "https://i.pinimg.com/564x/b1/7b/6f/b17b6f2ad36a7415641666f8d72e7305.jpg",
      "title": "Classic Pullover Hoodie",
      "price": 600,
      "description":
          "Stay cozy and stylish with our Classic Pullover Hoodie. Made from premium fleece, it features a spacious kangaroo pocket and an adjustable drawstring hood. Available in several versatile colors.",
      "rating": "4.8",
      "id": 7
    },
    {
      "image":
          "https://i.pinimg.com/564x/60/da/3d/60da3d0b0448a6286240364af8479db2.jpg",
      "title": "Sporty Running Sneakers",
      "price": 900,
      "description":
          "Push your limits with our Sporty Running Sneakers. Designed for performance, these sneakers feature breathable mesh, cushioned soles, and durable grip for optimal support during your runs.",
      "rating": "4.7",
      "id": 8
    },
    {
      "image":
          "https://i.pinimg.com/564x/14/06/dc/1406dc24fb0a78e146b7d16f651266d1.jpg",
      "title": "Classic Leather Loafers",
      "price": 1200,
      "description":
          "Elevate your style with our Classic Leather Loafers. Crafted from premium leather, these loafers offer a timeless look with superior comfort. Perfect for both casual and formal occasions.",
      "rating": "4.6",
      "id": 9
    },
    {
      "image":
          "https://i.pinimg.com/564x/cb/bb/9b/cbbb9b0fb04851bb2b8f62ad5e0b1050.jpg",
      "title": "Chic Ankle Boots",
      "price": 1500,
      "description":
          "Add a touch of sophistication to your outfit with our Chic Ankle Boots. Made from high-quality suede, these boots offer both elegance and comfort with a sleek, versatile design.",
      "rating": "4.8",
      "id": 10
    },
    {
      "image":
          "https://i.pinimg.com/236x/9b/94/27/9b942733b3d9e7313e8ed1eef506abba.jpg",
      "title": "Floral Short-Sleeve Shirt",
      "price": 500,
      "description":
          "Add a splash of color to your wardrobe with our Floral Short-Sleeve Shirt. Crafted from soft, breathable fabric, it features a vibrant floral pattern, making it perfect for casual outings.",
      "rating": "4.5",
      "id": 11
    },
    {
      "image":
          "https://i.pinimg.com/564x/58/9b/22/589b226388673a08801c060c4b3ef655.jpg",
      "title": "Striped Oxford Shirt",
      "price": 650,
      "description":
          "Our Striped Oxford Shirt combines classic design with modern comfort. Featuring a distinctive stripe pattern and made from durable Oxford cloth, it's ideal for both work and play.",
      "rating": "4.7",
      "id": 12
    },
    {
      "image":
          "https://i.pinimg.com/236x/f4/45/2f/f4452f7db8de1bcd51d2d6a93e29d30b.jpg",
      "title": "Casual Chambray Button-Down",
      "price": 550,
      "description":
          "Embrace casual style with our Chambray Button-Down Shirt. Made from lightweight, breathable fabric, this shirt offers a relaxed fit with a subtle, stylish texture.",
      "rating": "4.4",
      "id": 13
    },
    {
      "image":
          "https://i.pinimg.com/736x/74/79/8e/74798e9b09300df7374125d5ce5fe1d0.jpg",
      "title": "Classic White Dress Shirt",
      "price": 700,
      "description":
          "A wardrobe essential, our Classic White Dress Shirt features a crisp, tailored fit and is made from high-quality cotton. Perfect for formal occasions and professional settings.",
      "rating": "4.6",
      "id": 14
    },
    {
      "image":
          "https://i.pinimg.com/236x/2f/e0/30/2fe030a4b35f574a4f090658e486bb3b.jpg",
      "title": "Elegant A-Line Midi Dress",
      "price": 1200,
      "description":
          "Embrace timeless elegance with our A-Line Midi Dress. Featuring a flattering cinched waist and a flowy skirt, this dress is perfect for formal events and special occasions. Made from luxurious fabric for a comfortable fit.",
      "rating": "4.8",
      "id": 15
    },
    {
      "image":
          "https://i.pinimg.com/564x/3c/b5/3e/3cb53e943c0c61ac065654323255b872.jpg",
      "title": "Boho Maxi Dress",
      "price": 950,
      "description":
          "Step into summer with our Boho Maxi Dress. Crafted from lightweight, breathable fabric, this dress features a relaxed fit, intricate patterns, and a tiered skirt for a carefree, bohemian vibe.",
      "rating": "4.6",
      "id": 16
    },
    {
      "image":
          "https://i.pinimg.com/236x/93/82/48/938248dd331b58fad4100717ef12348d.jpg",
      "title": "Chic Off-Shoulder Dress",
      "price": 800,
      "description":
          "Show off your style with our Chic Off-Shoulder Dress. The trendy off-shoulder design and fitted bodice make it a standout choice for both casual and semi-formal occasions. Made from soft, stretchable fabric for comfort.",
      "rating": "4.7",
      "id": 17
    },
    {
      "image":
          "https://i.pinimg.com/236x/ff/6d/64/ff6d64c575f313afaf85accfe0395d87.jpg",
      "title": "Classic Shift Dress",
      "price": 700,
      "description":
          "Our Classic Shift Dress is a versatile wardrobe staple. With its simple, streamlined silhouette and elegant detailing, this dress is perfect for both office wear and evening outings. Available in a range of classic colors.",
      "rating": "4.5",
      "id": 18
    },
    {
      "image":
          "https://i.pinimg.com/236x/1d/ed/7a/1ded7a9ce29bdfbfa7966956f271e23f.jpg",
      "title": "Classic Black Stiletto Heels",
      "price": 1500,
      "description":
          "Elevate your look with our Classic Black Stiletto Heels. Featuring a sleek design and high-quality leather, these heels are perfect for formal events and night outs. The pointed toe and slender heel add a touch of sophistication.",
      "rating": "4.7",
      "id": 19
    },
    {
      "image":
          "https://i.pinimg.com/236x/92/ae/f5/92aef5d1a6af35aca080f1a584aa4dec.jpg",
      "title": "Elegant Nude Pumps",
      "price": 1300,
      "description":
          "Our Elegant Nude Pumps are a versatile addition to any wardrobe. Made from soft suede, these pumps offer both comfort and style with their classic design and moderate heel height, ideal for both office and evening wear.",
      "rating": "4.6",
      "id": 20
    },
    {
      "image":
          "https://i.pinimg.com/236x/50/59/d2/5059d2ac797ace00e90f6438a7b6ec13.jpg",
      "title": "Strappy Metallic Heels",
      "price": 1700,
      "description":
          "Make a statement with our Strappy Metallic Heels. Designed with shimmering metallic straps and a chic ankle buckle, these heels are perfect for adding a glamorous touch to your outfit for special occasions and parties.",
      "rating": "4.8",
      "id": 21
    },
    {
      "image":
          "https://i.pinimg.com/236x/9e/53/6a/9e536aa1a0d681e9c5a6ad7c6d075c8f.jpg",
      "title": "Trendy Cat-Eye Sunglasses",
      "price": 950,
      "description":
          "Add a touch of glamour to your look with our Trendy Cat-Eye Sunglasses. Designed with a chic, angular frame and high-quality polarized lenses, these sunglasses are both fashionable and functional. Ideal for enhancing any summer outfit.",
      "rating": "4.6",
      "id": 22
    },
    {
      "image":
          "https://i.pinimg.com/236x/2c/c1/8d/2cc18d567931447d25e9cf1a68b63421.jpg",
      "title": "Classic Aviator Sunglasses",
      "price": 800,
      "description":
          "Experience timeless style with our Classic Aviator Sunglasses. Featuring a durable metal frame and UV-protected lenses, these sunglasses offer both sophistication and protection from the sun. Perfect for any outfit, from casual to formal.",
      "rating": "4.7",
      "id": 23
    },
    {
      "image":
          "https://i.pinimg.com/236x/4e/56/df/4e56df94380ab65cb25d441d63493ad4.jpg",
      "title": "Trendy Snapback Cap",
      "price": 350,
      "description":
          "Make a statement with our Trendy Snapback Cap. Featuring a bold design and a flat brim, this cap combines style and functionality. Adjustable snap closure ensures a perfect fit, while the high-quality material provides lasting comfort.",
      "rating": "4.7",
      "id": 24
    },
    {
      "image":
          "https://i.pinimg.com/564x/72/09/21/72092145fbe6671ddf3230b3efc7b51f.jpg",
      "title": "Stylish Crossbody Bag",
      "price": 1200,
      "description":
          "Add a touch of style to your look with our Stylish Crossbody Bag. Featuring a trendy design with adjustable straps and a compact yet functional size, this bag is ideal for keeping your essentials close while on the go. Available in various colors to match your personal style.",
      "rating": "4.6",
      "id": 25
    },
    {
      "image":
          "https://i.pinimg.com/236x/58/fe/37/58fe37a6ffb607365675a77aa1991171.jpg",
      "title": "Elegant Crossbody Bag",
      "price": 2000,
      "description":
          "Upgrade your accessory collection with our Elegant Leather Tote Bag. Crafted from premium leather, this spacious tote features a sleek design with comfortable handles and multiple interior pockets for organized storage. Perfect for both work and casual outings.",
      "rating": "4.8",
      "id": 26
    }
  ];
}
