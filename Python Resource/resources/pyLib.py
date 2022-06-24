from robot.api import logger
import numpy

class pyLib():

    baseNum = 1000

    def print_message(self, message):

        """Prints a custom message to log

        """

        logger.warn(message)

    def set_base(self, number):
        baseNum = number
    
    def squareroot_base(self):
        baseNum = numpy.sqrt(baseNum)
        return baseNum

    def double_base(self):
        baseNum = numpy.multiply(baseNum, 2.0)
        return baseNum
    
    def halve_base(self):
        baseNum = numpy.divide(baseNum, 2.0)
        return baseNum

    def sum_base(self, number):
        baseNum = numpy.add(baseNum, nummber)
        return baseNum