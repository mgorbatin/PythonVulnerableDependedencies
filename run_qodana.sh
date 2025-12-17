#rm -rf .idea/
rm -rf qodana-results
docker pull registry.jetbrains.team/p/sa/containers/qodana-jvm:2025.3-nightly
docker run --rm -it --platform linux/arm64 \
  -e QODANA_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcm9qZWN0IjoiNVpveW4iLCJvcmdhbml6YXRpb24iOiIzb0RycCIsInRva2VuIjoiR2dhUVgifQ.hySxJIiA3-5C1nDIgZTT8xGfzE_O_AshY0dHBD5nFJY \
  -v $(pwd)/:/data/project/ \
  -v ./qodana-results/:/data/results/ \
  registry.jetbrains.team/p/sa/containers/qodana-python-community:2025.3-nightly \
  --log-level=trace \
  --repository-root /data/project/ \
  --project-dir packages/core

#export QODANA_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcm9qZWN0IjoicDQ1YVciLCJvcmdhbml6YXRpb24iOiIzb0RycCIsInRva2VuIjoib0ROTDcifQ.Ay_Y0dalrQS-5m0gXYR45ICxi9_Rysfrry-qVg3nzCw
#qodana scan \
#  --image registry.jetbrains.team/p/sa/containers/qodana-python-community:2025.3-nightly \
#  --repository-root . \
#  --project-dir packages/core \
#  --results-dir qodana-results \
#  --log-level trace



#docker run --rm -a stdout -a stderr -it -u 501:20 -e QODANA_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcm9qZWN0IjoicDQ1YVciLCJvcmdhbml6YXRpb24iOiIzb0RycCIsInRva2VuIjoib0ROTDcifQ.Ay_Y0dalrQS-5m0gXYR45ICxi9_Rysfrry-qVg3nzCw -e QODANA_ENV=cli:dev -v /Users/mgorbatin/IdeaProjects/1/tests/PythonSimple:/data/project -v /Users/mgorbatin/IdeaProjects/1/tests/PythonSimple/qodana-results:/data/results -v /Users/mgorbatin/IdeaProjects/1/tests/PythonSimple/qodana-results/report:/data/results/report registry.jetbrains.team/p/sa/containers/qodana-python-community:2025.3-nightly --save-report --project-dir /data/project/packages/core --repository-root /data/project --analysis-id 3a305da3-ebe1-45bf-8518-b8aa02bb980a --coverage-dir packages/core/.qodana/code-coverage