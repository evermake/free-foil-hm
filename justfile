default:
  just --list

build:
  mkdir -p dist
  ghc -isrc -outputdir dist -o dist/interpreter -main-is HM.Main src/HM/Main.hs

generate-parser:
  rm -rf src/HM/Parser
  bnfc --haskell -p HM.Parser -o src grammar/HM.cf 
  alex src/HM/Parser/LexHM.x
  happy src/HM/Parser/ParHM.y
