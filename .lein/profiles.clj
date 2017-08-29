{:repl {:plugins [[cider/cider-nrepl "0.15.0-SNAPSHOT"]
                  [refactor-nrepl "2.3.0-SNAPSHOT"]]
        :dependencies [[alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [proto-repl "0.3.1"]]}
 :user {:plugins [[lein-ancient "0.6.10"]
                  [com.jakemccrary/lein-test-refresh "0.18.1"]
                  [venantius/ultra "0.5.0"]
                  [lein-kibit "0.1.3"]
                  [lein-repetition-hunter "0.1.0-SNAPSHOT"]
                  [lein-exec "0.3.6"]]
        :dependencies [[repetition-hunter "1.0.0"]]
        :test-refresh {:quiet true
                       :changes-only true}}}
