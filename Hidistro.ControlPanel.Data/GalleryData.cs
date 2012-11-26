﻿using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;

namespace Hidistro.ControlPanel.Data
{
    public class GalleryData : GalleryProvider
    {
        Database database = DatabaseFactory.CreateDatabase();

        public override bool AddPhote(int categoryId, string photoName, string photoPath, int fileSize)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("INSERT INTO Hishop_PhotoGallery(CategoryId, PhotoName, PhotoPath, FileSize, UploadTime, LastUpdateTime) VALUES (@CategoryId, @PhotoName, @PhotoPath, @FileSize, @UploadTime, @LastUpdateTime)");
            database.AddInParameter(sqlStringCommand, "CategoryId", DbType.Int32, categoryId);
            database.AddInParameter(sqlStringCommand, "PhotoName", DbType.String, photoName);
            database.AddInParameter(sqlStringCommand, "PhotoPath", DbType.String, photoPath);
            database.AddInParameter(sqlStringCommand, "FileSize", DbType.Int32, fileSize);
            database.AddInParameter(sqlStringCommand, "UploadTime", DbType.DateTime, DateTime.Now);
            database.AddInParameter(sqlStringCommand, "LastUpdateTime", DbType.DateTime, DateTime.Now);
            return (database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public override bool AddPhotoCategory(string name)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("DECLARE @DisplaySequence INT; SELECT @DisplaySequence = ISNULL(MAX(DisplaySequence), 0) + 1 FROM Hishop_PhotoCategories; INSERT Hishop_PhotoCategories (CategoryName, DisplaySequence) VALUES (@CategoryName, @DisplaySequence)");
            database.AddInParameter(sqlStringCommand, "CategoryName", DbType.String, name);
            return (database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public override bool DeletePhoto(int photoId)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("DELETE FROM Hishop_PhotoGallery WHERE PhotoId = @PhotoId");
            database.AddInParameter(sqlStringCommand, "PhotoId", DbType.Int32, photoId);
            return (database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public override bool DeletePhotoCategory(int categoryId)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("DELETE FROM Hishop_PhotoCategories WHERE CategoryId = @CategoryId; UPDATE Hishop_PhotoGallery SET CategoryId = 0 WHERE CategoryId = @CategoryId");
            database.AddInParameter(sqlStringCommand, "CategoryId", DbType.Int32, categoryId);
            return (database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public override DataTable GetPhotoCategories()
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("SELECT *, (SELECT COUNT(PhotoId) FROM Hishop_PhotoGallery WHERE CategoryId = pc.CategoryId) AS PhotoCounts FROM Hishop_PhotoCategories pc ORDER BY DisplaySequence DESC");
            using (IDataReader reader = database.ExecuteReader(sqlStringCommand))
            {
                return DataHelper.ConverDataReaderToDataTable(reader);
            }
        }

        public override int GetPhotoCount()
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("SELECT count(*) FROM Hishop_PhotoGallery");
            return Convert.ToInt32(database.ExecuteScalar(sqlStringCommand));
        }

        public override DbQueryResult GetPhotoList(string keyword, int? categoryId, Pagination page)
        {
            string str = string.Empty;
            if (!string.IsNullOrEmpty(keyword))
            {
                str = str + string.Format("PhotoName LIKE '%{0}%'", DataHelper.CleanSearchString(keyword));
            }
            if (categoryId.HasValue)
            {
                if (!string.IsNullOrEmpty(str))
                {
                    str = str + " AND";
                }
                str = str + string.Format(" CategoryId = {0}", categoryId.Value);
            }
            return DataHelper.PagingByRownumber(page.PageIndex, page.PageSize, page.SortBy, page.SortOrder, page.IsCount, "Hishop_PhotoGallery", "ProductId", str, "*");
        }

        public override string GetPhotoPath(int photoId)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("SELECT PhotoPath FROM Hishop_PhotoGallery WHERE PhotoId = @PhotoId");
            database.AddInParameter(sqlStringCommand, "PhotoId", DbType.Int32, photoId);
            return database.ExecuteScalar(sqlStringCommand).ToString();
        }

        public override int MovePhotoType(List<int> pList, int pTypeId)
        {
            if (pList.Count <= 0)
            {
                return 0;
            }
            string str = string.Empty;
            foreach (int num in pList)
            {
                str = str + num + ",";
            }
            str = str.Remove(str.Length - 1);
            DbCommand sqlStringCommand = database.GetSqlStringCommand(string.Format("UPDATE Hishop_PhotoGallery SET CategoryId = @CategoryId WHERE PhotoId IN ({0})", str));
            database.AddInParameter(sqlStringCommand, "CategoryId", DbType.Int32, pTypeId);
            return database.ExecuteNonQuery(sqlStringCommand);
        }

        public override void RenamePhoto(int photoId, string newName)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("UPDATE Hishop_PhotoGallery SET PhotoName = @PhotoName WHERE PhotoId = @PhotoId");
            database.AddInParameter(sqlStringCommand, "PhotoId", DbType.Int32, photoId);
            database.AddInParameter(sqlStringCommand, "PhotoName", DbType.String, newName);
            database.ExecuteNonQuery(sqlStringCommand);
        }

        public override void ReplacePhoto(int photoId, int fileSize)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("UPDATE Hishop_PhotoGallery SET FileSize = @FileSize, LastUpdateTime = @LastUpdateTime WHERE PhotoId = @PhotoId");
            database.AddInParameter(sqlStringCommand, "PhotoId", DbType.Int32, photoId);
            database.AddInParameter(sqlStringCommand, "FileSize", DbType.Int32, fileSize);
            database.AddInParameter(sqlStringCommand, "LastUpdateTime", DbType.DateTime, DateTime.Now);
            database.ExecuteNonQuery(sqlStringCommand);
        }

        public override void SwapSequence(int categoryId1, int categoryId2)
        {
            DbCommand sqlStringCommand = database.GetSqlStringCommand("DECLARE @DisplaySequence1 INT , @DisplaySequence2 INT;  SELECT @DisplaySequence1 = DisplaySequence FROM Hishop_PhotoCategories WHERE CategoryId = @CategoryId1; SELECT @DisplaySequence2 = DisplaySequence FROM Hishop_PhotoCategories WHERE CategoryId = @CategoryId2; UPDATE Hishop_PhotoCategories SET DisplaySequence = @DisplaySequence1 WHERE CategoryId = @CategoryId2; UPDATE Hishop_PhotoCategories SET DisplaySequence = @DisplaySequence2 WHERE CategoryId = @CategoryId1");
            database.AddInParameter(sqlStringCommand, "CategoryId1", DbType.Int32, categoryId1);
            database.AddInParameter(sqlStringCommand, "CategoryId2", DbType.Int32, categoryId2);
            database.ExecuteNonQuery(sqlStringCommand);
        }

        public override int UpdatePhotoCategories(Dictionary<int, string> photoCategorys)
        {
            if (photoCategorys.Count <= 0)
            {
                return 0;
            }
            DbCommand sqlStringCommand = database.GetSqlStringCommand(" ");
            StringBuilder builder = new StringBuilder();
            foreach (int num in photoCategorys.Keys)
            {
                string str = num.ToString();
                builder.AppendFormat("UPDATE Hishop_PhotoCategories SET CategoryName = @CategoryName{0} WHERE CategoryId = {0}", str);
                database.AddInParameter(sqlStringCommand, "CategoryName" + str, DbType.String, photoCategorys[num]);
            }
            sqlStringCommand.CommandText = builder.ToString();
            return database.ExecuteNonQuery(sqlStringCommand);
        }
    }
}

