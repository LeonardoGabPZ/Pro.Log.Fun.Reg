{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

import Database.Persist.TH
import Database.Persist.Postgresql
import Control.Monad.IO.Class (liftIO)

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
User
    name String
    age Int
    deriving Show
|]

main :: IO ()
main = runSqlite "test.db" $ do
    runMigration migrateAll

    -- Insertar usuarios
    insert $ User "Alice" 30
    insert $ User "Bob" 25

    -- Consultar usuarios mayores de 25 años
    users <- selectList [UserAge >. 25] []
    liftIO $ print users
