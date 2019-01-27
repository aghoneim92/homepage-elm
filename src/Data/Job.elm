module Data.Job exposing (Job, jobs)


type alias Job =
    { company : String
    , position : String
    , from : String
    , to : String
    , technologies : List String
    }


jobs : List Job
jobs =
    [ { company = "FRIDAY Car Insurance"
      , position = "Software Engineer"
      , from = "December 2017"
      , to = "October 2018"
      , technologies =
            [ "Spring Boot 2"
            , "Kotlin"
            , "React"
            , "Typescript"
            ]
      }
    , { company = "pruefungspaten.de"
      , position = "Fullstack Developer"
      , from = "February 2017"
      , to = "October 2017"
      , technologies =
            [ "PHP 7"
            , "mySQL"
            , "jQuery + Vanilla JS"
            ]
      }
    , { company = "Eventum IT Solutions"
      , position = "Junior Software Engineer"
      , from = "August 2014"
      , to = "August 2016"
      , technologies =
            [ "Spring Framework (MVC)"
            , "React"
            , "d3.js"
            , "NodeJS"
            ]
      }
    , { company = "Cartage  Real  Estate  Development"
      , position = "Software Engineering Intern"
      , from = "June 2011"
      , to = "November 2011"
      , technologies = [ "Visual C#", "SQL Server" ]
      }
    ]
