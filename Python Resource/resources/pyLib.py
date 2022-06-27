from robot.api import logger
import numpy

class pyLib():

    def print_message(self, message):

        """Prints a custom message to log

        """

        logger.warn(message)
    
    def squareroot(self, baseNum):
        logger.warn("Taking Squareroot of %s" %(baseNum))
        newNum = numpy.sqrt(float(baseNum))
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum

    def double(self, baseNum):
        logger.warn("Doubling the value of %s" %(baseNum))
        newNum = numpy.multiply(float(baseNum), 2.0)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum
    
    def halve(self, baseNum):
        logger.warn("Halving the value of %s" %(baseNum))
        newNum = numpy.divide(float(baseNum),2.0)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum

    def sum(self, baseNum, number):
        logger.warn("Summming the values of %s and %s" %(baseNum,number))
        newNum = numpy.add(float(baseNum), float(number))
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum