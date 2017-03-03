require 'algorithmia'

input = {
  document: "I really like Algorithmia!"
}
client = Algorithmia.client('simfbN8P4yYea9DAJza5vcPSp811')
algo = client.algo('nlp/SentimentAnalysis/1.0.3')
puts algo.pipe(input).result