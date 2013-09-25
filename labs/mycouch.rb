# Web Engineering: Comp 120
# Lab 1: Ruby and CouchDB
# Nicholas Teleky
# September 21, 2013
require "CouchDB"

# Create a database that is the same name as my github handle
server = CouchDB::Server.new "67.23.79.113", 5984
database = CouchDB::Database.new server, "nteleky"
database.delete_if_exists!
database.create_if_missing!

# Insert a document into the database
document_one = CouchDB::Document.new database, "_id" => "Doc 1", "type" => "testdoc"
document_one.save

print server.database_names()
