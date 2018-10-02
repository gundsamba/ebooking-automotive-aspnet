using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ebooking.cs
{
    public class MyException : Exception
    {
        public MyException() { }
        public MyException(string message) : base(message) { }
        public MyException(string message, Exception inner) : base(message, inner) { }
    }
}