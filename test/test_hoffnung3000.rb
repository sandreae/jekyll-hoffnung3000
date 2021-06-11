# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/jekyll/hoffnung3000/main"

TEST_DATA = '{
    "data": [
        {
            "id": 55,
            "placeId": 10,
            "animalId": 94,
            "isPublic": true,
            "title": "Title",
            "slug": "slug",
            "description": "Description",
            "tags": [
                "Feminism",
                "Gender",
                "Care",
                "Sex",
                "Bodies",
                "Art",
                "Anticapitalism",
                "Workshop"
            ],
            "ticketUrl": "",
            "additionalInfo": "link",
            "websiteUrl": "link",
            "createdAt": "2020-04-27T10:14:00.439Z",
            "updatedAt": "2020-04-27T10:14:00.439Z",
            "animal": {
                "id": 94,
                "name": "Unexplained unicorn",
                "userId": 41,
                "userName": "SIGGIE  VERTOMMEN"
            },
            "resources": [],
            "place": {
                "id": 10,
                "animalId": 32,
                "title": "Mayday Rooms [online location]",
                "slug": "mayday-rooms",
                "mode": "virtual",
                "description": "Venue description",
                "isPublic": true,
                "slotSize": 60,
                "latitude": 51.50642,
                "longitude": -0.127209999999934,
                "street": "",
                "cityCode": "",
                "city": "London",
                "country": "UK",
                "accessibilityInfo": "Online only",
                "capacity": "40",
                "createdAt": "2020-04-09T15:59:20.057Z",
                "updatedAt": "2020-04-12T12:31:35.569Z"
            },
            "images": [
                {
                    "id": 109,
                    "fileName": "cb490e69bd3e420ec9242c52ee3835be.jpg",
                    "largeImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/cb490e69bd3e420ec9242c52ee3835be-large.jpg",
                    "mediumImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/cb490e69bd3e420ec9242c52ee3835be-medium.jpg",
                    "smallImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/cb490e69bd3e420ec9242c52ee3835be-small.jpg",
                    "createdAt": "2020-04-27T10:14:00.461Z",
                    "updatedAt": "2020-04-27T10:14:00.461Z",
                    "objectsImages": {
                        "objectType": "event",
                        "objectId": 55,
                        "imageId": 109,
                        "createdAt": "2020-04-27T10:14:00.863Z",
                        "updatedAt": "2020-04-27T10:14:00.863Z"
                    }
                }
            ],
            "slots": [
                {
                    "id": 9434,
                    "placeId": 10,
                    "eventId": 55,
                    "from": "2020-05-01T19:00:00.000Z",
                    "to": "2020-05-01T20:00:00.000Z",
                    "slotIndex": 19,
                    "isDisabled": false
                },
                {
                    "id": 9435,
                    "placeId": 10,
                    "eventId": 55,
                    "from": "2020-05-01T20:00:00.000Z",
                    "to": "2020-05-01T21:00:00.000Z",
                    "slotIndex": 20,
                    "isDisabled": false
                }
            ],
            "isOwnerMe": false,
            "descriptionHtml": "description",
            "additionalInfoHtml": "<p>info</p>\n"
        }
    ],
    "limit": 2,
    "offset": 0,
    "total": 115
}'

class Hoffnung3000Test < Minitest::Test
  def test_format_data
    assert_equal "Title", format_data(TEST_DATA, "events")[0]["title"]
    assert_equal "Description", format_data(TEST_DATA, "events")[0]["description"]
  end
end
