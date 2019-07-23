//package com.tmna.ct.telematics.qa.apitesting.utility;
//
//import com.tmna.ct.logging.ILogService;
//
//import lombok.AllArgsConstructor;
//
///**
// * This class is used to define the utility methods related to logging.
// *
// * @author Srini Y, Henry Peng
// * @version 1.0
// */
//@AllArgsConstructor
//public class LogUtils {
//
//	protected ILogService logger;
//
//    /**
//     * This method is used to log error info
//     *
//     * @param logger     logger
//     * @param logMessage log description
//     */
//    public void logMessage(String logMessage) {
//        logMessage(logger, logMessage);
//    }
//
//    public static void logMessage(ILogService logger, String logMessage) {
//        logger.info(logMessage);
//    }
//
//    /**
//     * This method is used to log error info
//     *
//     * @param logger     logger
//     * @param logMessage log description
//     */
//    public void logDebugInfo(String logMessage) {
//        logDebugInfo(logger, logMessage);
//    }
//
//    public static void logDebugInfo(ILogService logger, String logMessage) {
//        logger.debug(logMessage);
//    }
//
//    /**
//     * This method is used to log error info
//     *
//     * @param logger          logger
//     * @param logErrorMessage error description
//     */
//    public void logErrorInfo(String logErrorMessage) {
//        logErrorInfo(logger, logErrorMessage);
//    }
//
//    public static void logErrorInfo(ILogService logger, String logErrorMessage) {
//        logger.error(logErrorMessage);
//    }
//
//    /**
//     * This method is used to capture the entry point of a method.
//     *
//     * @param logger logger
//     */
//    public void logMethodEntry() {
//    	logMethodEntry(logger);
//    }
//
//    public static void logMethodEntry(ILogService logger) {
//        if (logger.isInfoEnabled()) {
//            logger.info(Constants.METHOD_ENTRY);
//        }
//    }
//
//    /**
//     * This method is used to capture the exist point of a method.
//     *
//     * @param logger logger
//     * @param exitType exitType
//     */
//    public void logMethodExit(String exitType) {
//    	logMethodExit(logger, exitType);
//    }
//
//    public static void logMethodExit(ILogService logger, String exitType) {
//        if (logger.isInfoEnabled()) {
//            logger.info(exitType);
//        }
//    }
//
//
//}
