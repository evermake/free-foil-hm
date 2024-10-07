{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE KindSignatures    #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE PatternSynonyms   #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TemplateHaskell   #-}

module HM.Syntax.Pattern where


import qualified HM.Parser.Abs as Raw
import           Control.Monad.Foil.TH


-- ** Scope-safe patterns

mkFoilPattern ''Raw.Ident ''Raw.Pattern
deriveCoSinkable ''Raw.Ident ''Raw.Pattern
mkToFoilPattern ''Raw.Ident ''Raw.Pattern
mkFromFoilPattern ''Raw.Ident ''Raw.Pattern