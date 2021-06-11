# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/jekyll/hoffnung3000/main"

TEST_EVENT_DATA = '{
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

TEST_PLACE_DATA = '{
    "data": [
        {
            "id": 36,
            "animalId": 253,
            "title": "Place Title",
            "slug": "slug",
            "mode": "virtual",
            "description": "Description of place",
            "isPublic": true,
            "slotSize": 60,
            "latitude": 51.50642,
            "longitude": -0.127209999999934,
            "street": "",
            "cityCode": "",
            "city": "London",
            "country": "UK                                                                                                                                                                                                                                                             ",
            "accessibilityInfo": "internet",
            "capacity": "n.a.",
            "createdAt": "2020-05-29T20:14:07.615Z",
            "updatedAt": "2020-05-29T20:14:07.615Z",
            "animal": {
                "id": 253,
                "name": "Xerophobic xiphosuran",
                "userId": 137,
                "userName": "Username"
            },
            "slots": [
                {
                    "id": 21817,
                    "placeId": 36,
                    "eventId": 179,
                    "from": "2020-06-06T23:00:00.000Z",
                    "to": "2020-06-07T00:00:00.000Z",
                    "slotIndex": 887,
                    "isDisabled": false,
                    "createdAt": "2020-05-29T22:33:07.335Z",
                    "updatedAt": "2020-05-29T22:33:07.335Z"
                },
                {
                    "id": 21818,
                    "placeId": 36,
                    "eventId": 179,
                    "from": "2020-06-07T00:00:00.000Z",
                    "to": "2020-06-07T01:00:00.000Z",
                    "slotIndex": 888,
                    "isDisabled": false,
                    "createdAt": "2020-05-29T22:33:07.335Z",
                    "updatedAt": "2020-05-29T22:33:07.335Z"
                },
                {
                    "id": 21815,
                    "placeId": 36,
                    "eventId": 179,
                    "from": "2020-06-06T21:00:00.000Z",
                    "to": "2020-06-06T22:00:00.000Z",
                    "slotIndex": 885,
                    "isDisabled": false,
                    "createdAt": "2020-05-29T22:33:07.335Z",
                    "updatedAt": "2020-05-29T22:33:07.335Z"
                },
                {
                    "id": 21816,
                    "placeId": 36,
                    "eventId": 179,
                    "from": "2020-06-06T22:00:00.000Z",
                    "to": "2020-06-06T23:00:00.000Z",
                    "slotIndex": 886,
                    "isDisabled": false,
                    "createdAt": "2020-05-29T22:33:07.335Z",
                    "updatedAt": "2020-05-29T22:33:07.335Z"
                }
            ],
            "images": [
                {
                    "id": 316,
                    "fileName": "ef7444d49b485b5da822a73a291305c8.jpg",
                    "largeImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/ef7444d49b485b5da822a73a291305c8-large.jpg",
                    "mediumImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/ef7444d49b485b5da822a73a291305c8-medium.jpg",
                    "smallImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/ef7444d49b485b5da822a73a291305c8-small.jpg",
                    "createdAt": "2020-05-29T20:14:07.640Z",
                    "updatedAt": "2020-05-29T20:14:07.640Z",
                    "objectsImages": {
                        "objectType": "place",
                        "objectId": 36,
                        "imageId": 316,
                        "createdAt": "2020-05-29T20:14:07.973Z",
                        "updatedAt": "2020-05-29T20:14:07.973Z"
                    }
                }
            ],
            "isOwnerMe": false,
            "descriptionHtml": "<p>Description</p>\n"
        },
        {
            "id": 35,
            "animalId": 248,
            "title": "Title of place",
            "slug": "slug",
            "mode": "gps",
            "description": "Description of place",
            "isPublic": true,
            "slotSize": 60,
            "latitude": 51.4928033608437,
            "longitude": -3.17090618305833,
            "street": "1a Inverness Place",
            "cityCode": "CF24 4TS",
            "city": "Cardiff",
            "country": "UK                                                                                                                                                                                                                                                             ",
            "accessibilityInfo": "Currently closed to public",
            "capacity": "50",
            "createdAt": "2020-05-27T09:56:30.001Z",
            "updatedAt": "2020-05-27T10:01:12.961Z",
            "animal": {
                "id": 248,
                "name": "Unfeared upupa",
                "userId": 109,
                "userName": "Name"
            },
            "slots": [
                {
                    "id": 21650,
                    "placeId": 35,
                    "eventId": null,
                    "from": "2020-06-09T03:00:00.000Z",
                    "to": "2020-06-09T04:00:00.000Z",
                    "slotIndex": 939,
                    "isDisabled": true,
                    "createdAt": "2020-05-27T10:01:13.315Z",
                    "updatedAt": "2020-05-27T10:01:13.315Z"
                }
            ],
            "images": [
                {
                    "id": 300,
                    "fileName": "a33fff914e1de39894afd560cebf331e.jpg",
                    "largeImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/a33fff914e1de39894afd560cebf331e-large.jpg",
                    "mediumImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/a33fff914e1de39894afd560cebf331e-medium.jpg",
                    "smallImageUrl": "https://s3.eu-west-2.amazonaws.com/antiuni-test/uploads/a33fff914e1de39894afd560cebf331e-small.jpg",
                    "createdAt": "2020-05-27T09:56:30.614Z",
                    "updatedAt": "2020-05-27T09:56:30.614Z",
                    "objectsImages": {
                        "objectType": "place",
                        "objectId": 35,
                        "imageId": 300,
                        "createdAt": "2020-05-27T09:56:33.485Z",
                        "updatedAt": "2020-05-27T09:56:33.485Z"
                    }
                }
            ],
            "isOwnerMe": false,
            "descriptionHtml": "<p>An empty shop unit / community space currently streaming audio projects</p>\n"
        }
    ],
    "limit": 2,
    "offset": 0,
    "total": 22
}'
class Hoffnung3000Test < Minitest::Test
  def test_format_data
    assert_equal "Title", format_data(TEST_EVENT_DATA, "events")[0]["title"]
    assert_equal "Description", format_data(TEST_EVENT_DATA, "events")[0]["description"]
    assert_equal "Place Title", format_data(TEST_PLACE_DATA, "places")[0]["title"]
    assert_equal "Description of place", format_data(TEST_PLACE_DATA, "places")[0]["description"]
  end
end
