# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CharityProject.destroy_all
CharityProject.create [
  {
    name: "Save rain forest",
    image_url: "https://images.pexels.com/photos/904807/pexels-photo-904807.jpeg?cs=srgb&dl=branches-daylight-environment-904807.jpg&fm=jpg",
    description: "Using drones and working with government agencies, two indigenous communities in Peru have gone from losing 5% of their land to 0% deforestation. Indigenous communities are protecting the rainforest even as they face pressure and violence from illegal coca growing, drug trafficking and logging."
  },
  {
    name: "Save the ocean",
    image_url: "https://img.depresident.com/wp-content/uploads/2016/02/Save-the-Ocean-T-shirts.jpg",
    description: "The Ocean Cleanup develops advanced technologies to rid the world's oceans of plastic. A full-scale deployment of our systems is estimated to clean up 50 % of the Great Pacific Garbage Patch every 5 years."
  },
  {
    name: "Carbon footprint project",
    image_url: "https://controlequipment.com.au/wp-content/uploads/2016/01/CO2-in-clouds-1170x630.jpg",
    description: "60 MW wind power project in the Indian state of Rajasthan to provide reliable, renewable power to the Rajasthan state electricity grid which is part of the Northern regional electricity grid. The project will lead to reduced greenhouse gas emissions because it displaces electricity from fossil fuel based electricity generation plants.",
  },
  {
    name: "BEF Water Restoration program",
    image_url: "http://www.baltana.com/files/wallpapers-8/River-Landscape-HD-Wallpapers-25857.jpg",
    description: "Every BEF Water Restoration Certificate® created represents 1000 gallons of water restored on your behalf. By purchasing BEF WRCs® you are directly contributing to the restoration of recreational and ecological vitality in critical freshwater ecosystems."
  }
]
