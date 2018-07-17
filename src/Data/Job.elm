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
      , to = "Present"
      , technologies =
            [ "Spring Boot 2"
            , "Kotlin"
            , "React"
            , "Typescript"
            ]
      }
    , { company = "SIXT Autovermietung"
      , position = "Frontend Developer"
      , from = "September 2017"
      , to = "November 2017"
      , technologies = [ "React" ]
      }
    , { company = "pruefungspaten.de"
      , position = "Fullstack Developer"
      , from = "March 2017"
      , to = "August 2017"
      , technologies =
            [ "PHP 7"
            , "mySQL"
            , "jQuery + Vanilla JS"
            ]
      }
    , { company = "Zalando SE"
      , position = "Software Engineer"
      , from = "September 2016"
      , to = "February 2017"
      , technologies =
            [ "React"
            , "AWS"
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
