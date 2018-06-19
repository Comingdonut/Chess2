﻿using Chess.ChessModels;
using System;

namespace Chess.ChessControl
{
    public class Commands
    {
        #region Variables
        private Utility util;
        #endregion
        public Commands()
        {
            util = new Utility();
        }
        /// <summary>
        /// Reads in lines from a file and checks for commands.
        /// </summary>
        /// <param name="line">A line from a file.</param>
        public void ReadLine(string line)
        {
            util.Board.PrintBoard();
            if (line.Length == util.Place_Piece)
            {
                util.ProcessLine(line, @"([KQBNRP])([ld])([a-h])([1-8])");
            }
            else if (line.Length == util.Move_Piece)
            {
                util.ProcessLine(line, @"([a-h])([1-8])([ ])([a-h])([1-8])");
            }
            else if (line.Length == util.Capture_Piece)
            {
                util.ProcessLine(line, @"([a-h])([1-8])([ ])([a-h])([1-8])([*])");
            }
            else if (line.Length == util.King_Side_Piece)
            {
                util.ProcessLine(line, @"([a-h])([1-8])([ ])([a-h])([1-8])([ ])([a-h])([1-8])([ ])([a-h])([1-8])");
            }
            else
            {
                Console.WriteLine("Invalid command...");
            }
            Console.WriteLine("<--------------------------------------------------->");
        }
        //-----------------------------------------------------------------------------------
    }
}
