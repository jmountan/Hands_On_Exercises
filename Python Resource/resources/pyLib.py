from robot.api import logger
import numpy

class pyLib():

    def print_message(self, message):

        """Prints a custom message to log

        """

        logger.warn(message)
    
    def squareroot(self, float(baseNum)):
        newNum = numpy.sqrt(baseNum)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum

    def double(self, float(baseNum)):
        newNum = numpy.multiply(baseNum, 2.0)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum
    
    def halve(self, float(baseNum)):
        newNum = numpy.divide(baseNum,2.0)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum

    def sum(self, float(baseNum), float(number)):
        newNum = numpy.add(baseNum, number)
        logger.warn("%s calculated to %s" %(baseNum,newNum))
        return newNum