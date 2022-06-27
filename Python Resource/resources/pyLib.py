from robot.api import logger
import numpy

class pyLib():

    def print_message(self, message):

        """Prints a custom message to log

        """

        logger.warn(message)
    
    def squareroot(self, baseNum):
        newNum = numpy.sqrt(float(baseNum))
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum

    def double(self, baseNum):
        newNum = numpy.multiply(float(baseNum), 2.0)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum
    
    def halve(self, baseNum):
        newNum = numpy.divide(float(baseNum),2.0)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum

    def sum(self, baseNum, number):
        newNum = numpy.add(float(baseNum), float(number))
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum