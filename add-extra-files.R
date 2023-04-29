# Copy the required webr js files into the build directory
file.copy("_extensions/coatless/webr/webr-serviceworker.js", "_site/webr-serviceworker.js")
file.copy("_extensions/coatless/webr/webr-worker.js", "_site/webr-worker.js")
file.copy("surveys.csv", "_site/surveys.csv")
file.copy("species.csv", "_site/species.csv")
file.copy("plots.csv", "_site/plots.csv")