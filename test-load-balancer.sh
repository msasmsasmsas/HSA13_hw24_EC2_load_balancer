for i in {1..10}; do
  curl http://WebALB-1693581179.eu-north-1.elb.amazonaws.com
  echo ""
  sleep 1
done
