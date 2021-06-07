package com.example.dobrypiesek

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import android.widget.Toast

//nazwy tabel i kolumn
val DATABASE_NAME ="DobryPiesekDB"

val TABLE_USER = "User"
val COL_USER_ID = "UserID"
val COL_USER_NAME = "UserName"
val COL_USER_DOGNAME = "DogName"

val TABLE_TRAINING = "Training"
val COL_TRAIN_ID = "TrainingID"
val COL_TRAIN_NAME = "TrainingName"
val COL_TRAIN_DES = "TrainingDescription"

val TABLE_EVENT = "Event"
val COL_EVENT_ID = "EventID"
val COL_EVENT_DATE = "EventDate"
val COL_EVENT_NAME = "EventName"

class DataBaseHandler (var context: Context) : SQLiteOpenHelper(context,DATABASE_NAME,null,1){
    override fun onCreate(db: SQLiteDatabase?) {

        val createTableUser = "CREATE TABLE " + TABLE_USER +" (" +
                COL_USER_ID +" INT PRIMARY KEY UNIQUE NOT NULL," +
                COL_USER_NAME + " VARCHAR(15)," +
                COL_USER_DOGNAME +" VARCHAR (15))"

        val createTableTrain = "CREATE TABLE " + TABLE_TRAINING +" (" +
                COL_TRAIN_ID +" INT PRIMARY KEY UNIQUE NOT NULL," +
                COL_TRAIN_NAME + " VARCHAR(40)," +
                COL_TRAIN_DES +" VARCHAR (250))"

        val createTableEvent = "CREATE TABLE " + TABLE_EVENT +" (" +
                COL_EVENT_ID +" INT PRIMARY KEY UNIQUE NOT NULL," +
                COL_EVENT_DATE + " DATE," +
                COL_EVENT_NAME +" VARCHAR (20))"

        db?.execSQL(createTableUser)
        db?.execSQL(createTableTrain)
        db?.execSQL(createTableEvent)

        val database = this.writableDatabase
        //insert user
        val contentValuesUser = ContentValues()
        contentValuesUser.put(COL_USER_NAME, "Kasia")
        contentValuesUser.put(COL_USER_DOGNAME, "Azor")
        val resultU = database.insert(TABLE_USER, null, contentValuesUser)
        //insert training
        val contentValuesTrain = ContentValues()
        contentValuesTrain.put(COL_TRAIN_NAME, "Łapka")
        contentValuesTrain.put(COL_TRAIN_DES, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel feugiat libero.")
        val resultT = database.insert(TABLE_TRAINING, null, contentValuesTrain)
        //insert Event
        val contentValuesEvent = ContentValues()
        contentValuesEvent.put(COL_EVENT_DATE, "21.06.2020")
        contentValuesEvent.put(COL_EVENT_NAME, "Weterynarz")
        val resultE = database.insert(TABLE_EVENT, null, contentValuesEvent)

    }

    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
        TODO("Not yet implemented")
    }

    fun readData(): String? {
        val db = this.readableDatabase

        val query = "Select * from $TABLE_USER"
        val result = db.rawQuery(query, null)
        val name = result.getString(result.getColumnIndex(COL_USER_NAME))
        val dogname = result.getString(result.getColumnIndex(COL_USER_DOGNAME))



        return name
    }
}