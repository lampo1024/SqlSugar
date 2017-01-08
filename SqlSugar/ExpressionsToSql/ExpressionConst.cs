﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
namespace SqlSugar
{
    internal class ExpressionConst
    {
        public const string BinaryExpressionInfoListKey = "BinaryExpressionInfoListKey";
        public const string BinaryFormatString = " ( {0} {1} {2} ) ";
        public const string Format0 = "{0}";
        public const string Format1 = "{1}";
        public readonly static Type MemberExpressionType = typeof(MemberExpression);
        public readonly static Type ConstantExpressionType = typeof(ConstantExpression);
        internal static string GetThrowMessage(string enMessage, string cnMessage, params string[] args)
        {
            List<string> formatArgs = new List<string>() { enMessage, cnMessage };
            formatArgs.AddRange(args);
            return string.Format("\r\n English Message : {0}\r\n Chinese Message : {1}", formatArgs.ToArray());
        }
    }
}