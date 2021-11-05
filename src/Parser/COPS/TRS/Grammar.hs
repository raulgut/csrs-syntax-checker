{-# LANGUAGE DeriveDataTypeable #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Parser.COPS.TRS.Grammar
-- Copyright   :  (c) muterm development team
-- License     :  see LICENSE
--
-- Maintainer  :  jiborra@dsic.upv.es
-- Stability   :  unstable
-- Portability :  non-portable
--
-- This module manage the grammar for TRSs in COPS
--
-----------------------------------------------------------------------------

module Parser.COPS.TRS.Grammar (

-- * Exported data

Spec(..), Decl(..), Equation (..), SimpleRule (..)
, Rule(..), Term (..), Id, CondType (..)

) where

import Data.Typeable
import Data.Generics

-----------------------------------------------------------------------------
-- Data
-----------------------------------------------------------------------------

-- | Specification declaration
data Spec = Spec [Decl] -- ^ List of declarations
            deriving (Eq, Show, Data, Typeable)

-- | List of declarations
data Decl = CType CondType -- ^ Type of conditional rules
   | Var [Id] -- ^ Set of variables
   | Signature [(Id,Int)] -- ^ Extended signature
   | Rules [Rule] -- ^ Set of rules
   | Context [(Id, [Int])] -- ^ Context-Sensitive strategy
   | Comment String -- ^ Extra information
     deriving (Eq, Show, Data, Typeable)

-- | Equation declaration
data Equation = Term :==: Term -- ^ Equation
              deriving (Eq, Show, Data, Typeable)

-- | Simple rule declaration
data SimpleRule = Term :-> Term -- ^ Rewriting rule
     deriving (Eq, Show, Data, Typeable)

-- | Rule declaration
data Rule = Rule SimpleRule [Equation] -- ^ Conditional rewriting rule
            deriving (Eq, Show, Data, Typeable)

-- | Term declaration
data Term = T Id [Term] -- ^ Term
            deriving (Eq, Show, Data, Typeable)

-- | Condition Type
data CondType =
  SemiEquational
  | Join
  | Oriented
  deriving (Eq, Show, Data, Typeable)

-- | Identifier
type Id = String
