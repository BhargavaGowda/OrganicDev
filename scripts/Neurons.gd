extends Object


var a = 0.0
var inps = []
var inpWeights = []
var bias = 0.0
var eta = 0.01

func forward():
	if len(inps)>0:
		a = 0.0
		for i in range(len(inps)):
			a+=inps[i].forward()*inpWeights[i]
			
	#else make sure to set a before calling forward!
	
	a+= bias
	
	if a < 0:
		a*=0.5
	return a
	
func backprop(error):
	error *= eta
	
	if a<0:
		error*=0.5
		bias -= error
		for i in range(len(inps)):
			inpWeights[i] += error*-1*inps[i].a
			inps[i].backprop(-1*inpWeights[i]*error)
	else:
		bias -= error
		for i in range(len(inps)):
			inpWeights[i] += error*-1*inps[i].a
			inps[i].backprop(-1*inpWeights[i]*error)
			

func decayWeights(decay=0.99):
	for i in range(len(inpWeights)):
		inpWeights[i] = decay*inpWeights[i]
	
	


