from robot.api import logger

class my_custom_library():

    def print_message(self, message):

        """Prints a custom message to log

        """

        logger.info(message)