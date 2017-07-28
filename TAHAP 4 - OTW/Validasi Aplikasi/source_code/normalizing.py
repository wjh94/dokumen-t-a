import sys
import os

arguments = sys.argv

print "Prediksi Kualitas Air Danau Toba Menggunakan Extreme Learning Machine"
print "121402071 - Eric Suwarno"
print "2017"
if len(arguments) != 2:
    print "Cara pemakaian: [python|python2] normalizing.py [file_path]"
    
    exit()

filename = arguments[1]
print "File sedang diproses. Silakan tunggu..."
print ""

try:
    file_object = open(filename)

    path_breaker = filename.split('\\')
    if path_breaker.__len__() == 1:
        path_breaker = filename.split('/')

    file_instance_name = path_breaker[path_breaker.__len__() - 1]
    identity = file_instance_name.split('_')
    location = identity[0]
    location[0].title()

    file_data = file_object.read()
    print "Sedang membuat file training dan testing..."
    print ""
    file_training = file(location + "_train.txt", 'w+')
    file_testing = file(location + "_test.txt", 'w+')

    data_rows = file_data.split("\n")

    num_of_training_data_row = data_rows.__len__() * 0.6
    start = 0
    for row in data_rows:
        ph = 0.0
        dox = 0.0
        orp = 0.0
        water_temp = 0.0
        humidity = 0.0
        outer_temp = 0.0
        timestr = ""

        normalized_ph = 0.0
        normalized_dox = 0.0
        normalized_orp = 0.0
        normalized_water_temp = 0.0
        normalized_humidity = 0.0
        normalized_outer_temp = 0.0

        row_params = row.split("\t")

        if row_params.__len__() < 8:
            break

        if row_params.__len__() == 8:
            for i in range(0, len(row_params)):
                if i == 0:
                    timestr = str(row_params[i])
                elif i == 1:
                    timestr = (timestr + " " + str(row_params[i]))
                elif i == 2:
                    dox = float(row_params[i])
                    normalized_dox = (((dox - 0) / (18 - 0)) * (1 - (-1))) - 1
                elif i == 3:
                    ph = float(row_params[i])
                    normalized_ph = (((dox - 0) / (20 - 0)) * (1 - (-1))) - 1
                elif i == 4:
                    orp = float(row_params[i])
                    normalized_orp = (((orp - (-1023.9)) / (1023.9 - (-1023.9))) * (1 - (-1))) - 1
                elif i == 5:
                    water_temp = float(row_params[i])
                    normalized_water_temp = (((water_temp - 20) / (37 - 0)) * (1 - (-1))) - 1
                elif i == 6:
                	humidity = float(row_params[i])
                	normalized_humidity = (((humidity - 0) / (100 - 0)) * (1 - (-1))) - 1
                elif i == 7:
                	outer_temp = float(row_params[i])
                	normalized_outer_temp = (((outer_temp - 20) / (37 - 20)) * (1 - (-1))) - 1
                	
        #timestr = timestr + " +0700"
        #print "%s %i %f %f %f %f %f" % (location, mktime(datetime.strptime(timestr, "%d-%m-%Y %H:%M:%S").timetuple()), normalized_dox, normalized_ph, normalized_water_temp, normalized_outer_temp, normalized_humidity)

        water_quality_index = 0.0
        if orp <= 650.0 or orp >= 800.0:
        	water_quality_index = water_quality_index - 6.0
        
        if ph >= 9.0 or ph <= 6.0:
        	water_quality_index = water_quality_index - 6.0
        
        if dox <= 6.0:
        	water_quality_index = water_quality_index - 6.0
                	
        if start < num_of_training_data_row:            
            file_training.write("%f %f %f %f %f %f %f\n" % (water_quality_index, normalized_dox, normalized_ph, normalized_water_temp, normalized_orp, normalized_outer_temp, normalized_humidity))
        else:
            file_testing.write("%f %f %f %f %f %f %f\n" % (water_quality_index, normalized_dox, normalized_ph, normalized_water_temp, normalized_orp, normalized_outer_temp, normalized_humidity))

        start = start + 1
        #print "%f %f %f %f %f %f" % (water_quality_index, normalized_dox, normalized_ph, normalized_water_temp, normalized_outer_temp, normalized_humidity)
        
    print "Preprocessing berhasil, file %s_train.txt dan %s_test.txt telah berhasil dibuat. Silakan gunakan file tersebut untuk proses training dan testing di aplikasi." % (location, location)
    print ""
except IOError as e:
    print "Kesalahan membuka file : %s" % (e.strerror)
